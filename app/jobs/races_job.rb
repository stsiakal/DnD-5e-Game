class RacesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Race.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], speed: api['speed'],
                                        ability_bonuses: api['ability_bonuses'], alignment: api['alignment'],
                                        age: api['age'], size: api['size'], size_description: api['size_description'],
                                        starting_proficiencies: api['starting_proficiencies'], languages: api['languages'],
                                        language_description: api['language_description'], traits: api['traits'], subraces: api['subraces'])
    current_attribute.save!
  end
end
