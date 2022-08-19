class MagicItemsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = MagicItem.find_or_create_by!(index: api['index'])

    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        rarity: api['rarity'], variants: api['variants'], variant: api['variant'])
    current_attribute.save!
  end
end
