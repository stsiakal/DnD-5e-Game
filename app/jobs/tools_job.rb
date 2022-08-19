class ToolsJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    current_attribute = Tool.find_or_create_by!(index: api['index'])
    current_attribute.assign_attributes(name: api['name'], desc: api['desc'], equipment_category: api['equipment_category']['name'],
                                        tool_category: api['tool_category'], cost: api['cost'], weight: api['weight'],
                                        contents: api['contents'], api['properties'].nil? ? properties: [] : properties: url_call(api['properties'][0]['url']))
    current_attribute.save!
  end
end
