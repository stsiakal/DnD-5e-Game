class CreateEquipmentPacks < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_packs do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.jsonb :gear_category
      t.jsonb :cost
      t.jsonb :contents
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
