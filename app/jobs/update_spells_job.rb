require 'uri'
require 'net/http'
require 'json'

class UpdateSpellsJob < ApplicationJob
  queue_as :high

  def perform
    result = spells_index
    count = 1
    result.each do |r|
      r['url']
      v = spells_data(r['url'])
      s = subclass(v) # subclass values
      sc = spells_data(v['school']['url'])
      current_spell = Spell.find_or_initialize_by(index: v['index'])
      current_spell.assign_attributes(name: v['name'], desc: v['desc'],
                                      higher_level: v['higher_level'], range: v['range'],
                                      components: v['components'], material: v['material'],
                                      ritual: v['ritual'], duration: v['duration'], concetration: v['concetration'],
                                      casting_time: v['casting_time'], level: v['level'], damage: v['damage'], dc: v['dc'],
                                      area_of_effect: v['area_of_effect'], school: sc, classes: v['classes'], subclasses: s)
      current_spell.save!
      puts "spell saved = #{count}"
      count += 1
    end
  end

  def spells_index
    url = URI("https://www.dnd5eapi.co/api/spells")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    result = JSON.parse(response.body)
    result['results']
  end

  def spells_data(api)
    url = URI("https://www.dnd5eapi.co#{api}")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end

  def subclass(api)
    subclass_hash = {}
    api['subclasses'].length.times do |index|
      result = spells_data(api['subclasses'][index]['url'])
      subclass_hash[index + 1] = { name: result['name'], index: result['index'], desc: result['desc'],
                                   class: result['class'], subclass_flavor: result['subclass_flavor'] }
    end
    subclass_hash
  end
end
