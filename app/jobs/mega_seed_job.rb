class MegaSeedJob < ApplicationJob
  queue_as :low
  include Workify

  def perform
    # Creates a new equipment if it doesnt already exist.
    Equipment.create unless Equipment.count.positive?
    # Run all API calls.
    api_calls = url_call
    api_calls.each do |_name, index|
      EndpointJob.perform_later(index)
    end
  end
end
