class EquipmentPack < ApplicationRecord
  include FetchEquipmentId
  belongs_to :equipment, polymorphic: true, optional: true
end
