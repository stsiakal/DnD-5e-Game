class AlignmentsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Alignment.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], abbreviation: api['abbreviation'])
    current_attribute.save!
  end
end
