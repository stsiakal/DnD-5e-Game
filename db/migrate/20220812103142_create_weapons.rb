class CreateWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :weapons do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.string :weapon_category
      t.string :weapon_range
      t.string :category_range
      t.jsonb :range
      t.jsonb :damage
      t.jsonb :two_handed_damange
      t.jsonb :properties
      t.jsonb :cost
      t.integer :weight
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
