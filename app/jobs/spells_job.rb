class SpellsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Spell.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], higher_level: api['higher_level'],
                                        range: api['range'], components: api['components'], material: api['material'],
                                        ritual: api['ritual'], duration: api['duration'], concetration: api['concetration'],
                                        casting_time: api['casting_time'], level: api['level'], damage: api['damage'], dc: api['dc'],
                                        area_of_effect: api['area_of_effect'], school: api['school'], classes: api['classes'],
                                        subclasses: api['subclasses'])
    current_attribute.save!
  end
end
