class AbilityScoresJob < ApplicationJob
  queue_as :high
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = AbilityScore.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], full_name: api['full_name'],
                                        skills: api['skills'])
    current_attribute.save!
  end
end
