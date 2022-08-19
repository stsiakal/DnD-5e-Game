class WeaponsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    binding.pry
    current_attribute = Weapon.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        weapon_category: api['weapon_category'], weapon_range: api['weapon_range'],
                                        category_range: api['category_range'], range: api['range'], damage: api['damage'],
                                        two_handed_damange: api['two_handed_damange'], properties: api['properties'].nil? ? [] : url_call(api['properties'][0]['url']),
                                        cost: api['cost'], weight: api['weight'])
    current_attribute.save!
  end
end
