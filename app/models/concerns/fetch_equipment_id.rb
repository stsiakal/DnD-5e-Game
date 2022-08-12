module FetchEquipmentId
  extend ActiveSupport::Concern
  included do
    after_initialize :equipment_id
  end

  def equipment_id
    Equipment.last.present?

    self.equipment = Equipment.last
  end
end
