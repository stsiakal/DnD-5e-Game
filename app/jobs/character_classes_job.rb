class CharacterClassesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = CharacterClass.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], hit_die: api['hit_die'],
                                        class_levels: api['class_levels'], multi_classing: api['multi_classing'],
                                        spellcasting: api['spellcasting'], spells: api['spells'],
                                        starting_equipment: api['starting_equipment'],
                                        starting_equipment_options: api['starting_equipment_options'],
                                        proficiency_choices: api['proficiency_choices'], proficiencies: api['proficiencies'],
                                        saving_throws: api['saving_throws'],
                                        subclasses: api['subclasses'])
    current_attribute.save!
  end
end
