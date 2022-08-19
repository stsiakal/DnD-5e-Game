require 'uri'
require 'net/http'
require 'json'

module Workify
  # Make a call to the dnd5e API and gets all the endpoints that are available
  def url_call(data = '/api')
    url = URI("https://www.dnd5eapi.co#{data}")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end
end
