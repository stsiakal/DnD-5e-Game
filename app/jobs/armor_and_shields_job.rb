class ArmorAndShieldsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    current_attribute = ArmorAndShield.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        armor_category: api['armor_category'], armor_class: api['armor_class'],
                                        str_minimum: api['str_minimum'], stealth_disadvantage: api['stealth_disadvantage'], cost: api['cost'], weight: api['weight'])
    current_attribute.save!
  end
end
