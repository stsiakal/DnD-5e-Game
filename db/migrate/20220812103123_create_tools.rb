class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :equipment_category
      t.jsonb :special
      t.text :tool_category
      t.jsonb :cost
      t.integer :weight
      t.text :contents
      t.text :properties
      t.references :equipment, polymorphic: true

      t.timestamps
    end
  end
end
