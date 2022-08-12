class CreateEquipmentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_categories do |t|
      t.string :index
      t.string :name

      t.timestamps
    end
  end
end
