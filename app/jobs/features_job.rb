class FeaturesJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    current_attribute = Feature.find_or_create_by!(index: api['index'])
    if !api['subclass'].nil? && !api['feature_specific'].nil?
      current_attribute.assign_attributes(name: api['name'], desc: api['desc'], level: api['level'], classes: api['classes'],
                                          subclass: api['subclass'], prerequisites: api['prerequisites'], feature_specific: api['feature_specific'])
    elsif !api['feature_specific'].nil?
      current_attribute.assign_attributes(name: api['name'], desc: api['desc'], level: api['level'], classes: api['classes'],
                                          prerequisites: api['prerequisites'], feature_specific: api['feature_specific'])
    else
      current_attribute.assign_attributes(name: api['name'], desc: api['desc'], level: api['level'], classes: api['classes'],
                                          prerequisites: api['prerequisites'], subclass: api['subclass'])
    end
    current_attribute.save!
  end
end
