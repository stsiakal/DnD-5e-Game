require 'uri'
require 'net/http'
require 'json'

class UpdateAbilityScoreJob < ApplicationJob
  queue_as :default

  def perform
    attributes = %w[cha con str dex int wis]
    attributes.each do |att|
      values = scores(att)
      skill = skills(values)
      current_attribute = AbilityScore.find_or_initialize_by(index: values['index'])
      current_attribute.assign_attributes(name: values['name'], desc: values['desc'],
                                          full_name: values['full_name'], skills: skill)
      puts 'abilityscore saved!'
      current_attribute.save!
    end
  end

  def scores(att)
    url = URI("https://www.dnd5eapi.co/api/ability-scores/#{att}")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end

  def skills(api)
    skill_hash = {}
    api['skills'].length.times do |index|
      result = skills_index(api['skills'][index]['url'])
      skill_hash[index + 1] = { name: result['name'], index: result['index'], desc: result['desc'] }
    end
    skill_hash
  end

  def skills_index(string)
    url = URI("https://www.dnd5eapi.co#{string}")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end
end
