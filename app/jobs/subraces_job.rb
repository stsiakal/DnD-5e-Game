class SubracesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Subrace.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], race: api['race'],
                                        ability_bonuses: api['ability_bonuses'], starting_proficiencies: api['starting_proficiencies'],
                                        languages: api['languages'], racial_traits: api['racial_traits'])
    current_attribute.save!
  end
end
