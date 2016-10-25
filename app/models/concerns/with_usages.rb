module WithUsages
  extend ActiveSupport::Concern

  included do
    has_many :usages, as: :item
    scope :currently_used, -> (q) { by_full_text(q='').map(&:usage_in_organization).compact }
  end

  def usage_in_organization(organization = Organization.current)
    usages.in_organization(organization).first.try(:parent_item)
  end

  def usage_in_organization_of_type(type, organization = Organization.current)
    item = usage_in_organization(organization)
    item.is_a?(type) ? item : nil
  end
end
