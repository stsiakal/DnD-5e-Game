class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :index
      t.string :name
      t.text :desc, array: true, default: []
      t.string :higher_level
      t.string :range
      t.text :components, array: true, default: []
      t.string :material
      t.boolean :ritual
      t.string :duration
      t.boolean :concetration
      t.string :casting_time
      t.integer :level
      t.string :attack_type
      t.jsonb :damage, null: false, default: {}
      t.jsonb :school, null: false, default: {}
      t.jsonb :classes, null: false, default: {}
      t.jsonb :subclasses, null: false, default: {}

      t.timestamps null: false
    end
  end
end
