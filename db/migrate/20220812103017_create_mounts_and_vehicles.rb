class CreateMountsAndVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :mounts_and_vehicles do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.text :vehicle_category
      t.jsonb :cost
      t.jsonb :speed
      t.string :capacity
      t.text :contents
      t.text :properties
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
