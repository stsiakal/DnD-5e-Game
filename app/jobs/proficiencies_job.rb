class ProficienciesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Proficiency.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], type: api['type'], classes: api['classes'],
                                        races: api['races'])
    current_attribute.save!
  end
end
