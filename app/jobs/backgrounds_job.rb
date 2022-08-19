class BackgroundsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)

    current_attribute = Background.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], starting_proficiencies: api['starting_proficiencies'],
                                        starting_equipment: api['starting_equipment'],
                                        starting_equipment_options: api['starting_equipment_options'],
                                        language_options: api['language_options'], feature: api['feature'],
                                        personality_traits: api['personality_traits'],
                                        ideals: api['ideals'], bonds: api['bonds'],
                                        flaws: api['flaws'])
    current_attribute.save!
  end
end
