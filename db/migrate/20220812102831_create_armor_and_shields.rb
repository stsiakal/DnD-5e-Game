class CreateArmorAndShields < ActiveRecord::Migration[7.0]
  def change
    create_table :armor_and_shields do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.string :armor_category
      t.jsonb :armor_class
      t.integer :str_minimum
      t.boolean :stealth_disadvantage
      t.jsonb :cost
      t.integer :weight
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
