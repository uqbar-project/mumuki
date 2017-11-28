module WithStatus
  extend ActiveSupport::Concern

  included do
    attribute :status, :status, default: -> { 0 }
    validates_presence_of :status
  end

  def passed?
    status.passed?
  end

  def run_update!
    running!
    begin
      update! yield
    rescue => e
      errored! e.message
      raise e
    end
  end

  def passed!
    update! status: Status::Passed
  end

  def running!
    update! status: Status::Running,
            result: nil,
            test_results: nil,
            expectation_results: [],
            manual_evaluation_comment: nil
  end

  def errored!(message)
    update! result: message, status: Status::Errored
  end

end
