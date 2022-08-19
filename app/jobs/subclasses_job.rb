class SubclassesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Subclass.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], classes: api['classes'],
                                        subclass_flavor: api['subclass_flavor'], subclass_levels: api['subclass_levels'],
                                        spells: api['spells'])
    current_attribute.save!
  end
end
