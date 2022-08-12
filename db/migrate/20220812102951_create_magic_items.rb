class CreateMagicItems < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_items do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.jsonb :rarity
      t.jsonb :variants
      t.boolean :variant
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
