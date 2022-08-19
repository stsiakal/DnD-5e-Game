class MonstersJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Monster.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], size: api['size'], type: api['type'],
                                        alignment: api['alignment'], armor_class: api['armor_class'], hit_points: api['hit_points'],
                                        hit_dice: api['hit_dice'], speed: api['speed'], strength: api['strength'], dexterity: api['dexterity'],
                                        constitution: api['constitution'], intelligence: api['intelligence'], wisdom: api['wisdom'], charisma: api['charisma'],
                                        proficiencies: api['proficiencies'], damage_vulnerabilities: api['damage_vulnerabilities'], damage_resistances: api['damage_resistances'],
                                        damage_immunities: api['damage_immunities'], condition_immunities: api['condition_immunities'], senses: api['senses'], languages: api['languages'],
                                        challenge_rating: api['challenge_rating'], xp: api['xp'], special_abilities: api['special_abilities'], actions: api['actions'], legendary_actions: api['legendary_actions'])
    current_attribute.save!
  end
end
