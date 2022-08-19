class EndpointJob < ApplicationJob
  queue_as :high
  include Workify

  def perform(index)
    urls_data = []
    # Calls the url_call endpoint and returns the data
    data = url_call(index)
    # Calls a URL and Returns an array of urls.
    data.each do |count, results|
      next unless count == 'results'

      results.each_with_index do |v, _i|
        urls_data << v['url']
      end
    end
    # Runs a DistributionJob for each url.
    urls_data.each do |el|
      DistributionJob.perform_later(el)
    end
  end
end
