require 'uri'
require 'net/http'
require 'json'

class UpdateTraitsJob < ApplicationJob
  queue_as :medium

  def perform
    result = traits_index
    result.each do |r|
      v = traits_data(r['url'])
      s = attributes(v) # races and subraces values
      current_traits = Trait.find_or_initialize_by(index: v['index'])
      current_traits.assign_attributes(races: s[1], subraces: s[0], name: v['name'], desc: v['desc'],
                                       parent: v['parent'], proficiencies: v['proficiencies'], trait_specific: v['trait_specific'])
      current_traits.save!
      puts "trait saved"
    end
  end

  def traits_index
    url = URI("https://www.dnd5eapi.co/api/traits")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    result = JSON.parse(response.body)
    result['results']
  end

  def traits_data(v)
    url = URI("https://www.dnd5eapi.co#{v}")
    http = Net::HTTP.new(url.hostname, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end

  def attributes(v)
    races_hash = {}
    subraces_hash = {}
    v['subraces'].length.times do |index|
      unless v['subraces'][index]['url'].nil?
        result = traits_data(v['subraces'][index]['url'])
        subraces_hash[index + 1] = { name: result['name'], index: result['index'], desc: result['desc'],
                                     race: result['race'], ability_bonuses: result['ability_bonuses'],
                                     starting_proficiencies: result['starting_proficiencies'], languages: result['languages'],
                                     racial_traits: result['racial_traits'] }
      end
      subraces_hash
    end
    v['races'].length.times do |index|
      next if v['races'][index]['url'].nil?

      result = traits_data(v['races'][index]['url'])
      races_hash[index + 1] = { name: result['name'], index: result['index'], speed: result['speed'],
                                ability_bonuses: result['ability_bonuses'], age: result['age'],
                                alignment: result['alignment'], size: result['size'],
                                size_description: result['size_description'], starting_proficiencies: result['starting_proficiencies'], languages: result['languages'],
                                language_desc: result['language_desc'], traits: result['traits'], subraces: result['subraces'] }
    end
    [subraces_hash, races_hash]
  end
end
