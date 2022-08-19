class SkillsJob < ApplicationJob
  queue_as :high
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Skill.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], ability_score: api['ability_score'])
    current_attribute.save!
  end
end
