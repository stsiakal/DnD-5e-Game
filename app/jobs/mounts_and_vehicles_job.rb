class MountsAndVehiclesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    current_attribute = MountsAndVehicle.find_or_create_by!(index: api['index'])

    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        vehicle_category: api['vehicle_category'], cost: api['cost'], speed: api['speed'],
                                        capacity: api['capacity'], contents: api['contents'], properties: api['properties'].nil? ? [] : url_call(api['properties'][0]['url']))
    current_attribute.save!
  end
end
