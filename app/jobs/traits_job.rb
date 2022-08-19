class TraitsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Trait.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], races: api['races'], subraces: api['subraces'],
                                        proficiencies: api['proficiencies'], trait_specific: api['trait_specific'])
    current_attribute.save!
  end
end
