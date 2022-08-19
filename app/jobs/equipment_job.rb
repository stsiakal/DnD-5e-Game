class EquipmentJob < ApplicationJob
  queue_as :default
  include Workify
  def perform(api)
    api = url_call(api)
    if api['equipment_category']['index'].include?('weapon')
      WeaponsJob.perform_later(api)
    elsif api['equipment_category']['index'].include?('armor')
      ArmorAndShieldsJob.perform_later(api)
    elsif api['equipment_category']['index'].include?('adventuring-gear')
      AdventuringGearJob.perform_later(api)
    elsif api['equipment_category']['index'].include?('equipment-packs')
      EquipmentPacksJob.perform_later(api)
    elsif api['equipment_category']['index'].include?('tools')
      ToolsJob.perform_later(api)
    else
      MountsAndVehiclesJob.perform_later(api)
    end
  end
end
