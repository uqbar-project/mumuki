class ApplicationController < ActionController::Base
  Mumukit::Login.configure_controller! self

  include WithOrganization

  include WithAuthentication
  include WithAuthorization
  include WithMessagesNotification
  include WithCustomAssets
  include Accessible
  include WithDynamicErrors
  include WithOrganizationChooser

  before_action :set_organization!
  before_action :set_cookie_domain!
  before_action :set_locale!
  before_action :authorize_if_private!
  before_action :validate_user_profile!, if: :current_user?
  before_action :validate_subject_accessible!
  before_action :visit_organization!, if: :current_user?

  helper_method :login_button,
                :messages_count,
                :has_messages?,
                :subject,
                :should_choose_organization?,
                :theme_stylesheet_url,
                :extension_javascript_url

  private

  def login_settings
    Organization.current.login_settings
  end

  def set_cookie_domain!
    return unless Organization.current.settings.laboratory_custom_domain
    Mumukit::Login.configure do |config|
      config.mucookie_domain = Organization.current.settings.laboratory_custom_domain
    end
  end

  def validate_user_profile!
    return if !current_user.has_accessible_organizations? || current_user.profile_completed?
    flash.notice = I18n.t :please_fill_profile_data
    redirect_to user_path
  end

  def set_locale!
    I18n.locale = Organization.current.locale
  end

  def subject #TODO may be used to remove breadcrumbs duplication
    nil
  end
end
