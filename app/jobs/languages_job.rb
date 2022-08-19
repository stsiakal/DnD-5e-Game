class LanguagesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Language.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], type: api['type'], typical_speakers: api['typical_speakers'],
                                        script: api['script'])
    current_attribute.save!
  end
end
