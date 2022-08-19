class AdventuringGearJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    current_attribute = AdventuringGear.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        gear_category: api['gear_category'], cost: api['cost'], weight: api['weight'])
    current_attribute.save!
  end
end
