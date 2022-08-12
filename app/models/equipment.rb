class Equipment < ApplicationRecord
  validate :there_can_only_be_one
  has_many :weapons, as: :equipment, dependent: :destroy
  has_many :armor_and_shields, as: :equipment, dependent: :destroy
  has_many :adventuring_gears, as: :equipment, dependent: :destroy
  has_many :equipment_packs, as: :equipment, dependent: :destroy
  has_many :tools, as: :equipment, dependent: :destroy
  has_many :mounts_and_vehicles, as: :equipment, dependent: :destroy

  private

    # Checks if there is only one equipment record.
  def there_can_only_be_one
    errors.add('Cannot have more than one equipment record') if Equipment.count.positive?
  end
end
