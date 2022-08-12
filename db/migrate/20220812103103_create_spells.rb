class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.string :higher_level
      t.string :range
      t.text :components
      t.string :material
      t.boolean :ritual, default: false
      t.string :duration
      t.boolean :concetration, default: false
      t.string :casting_time
      t.integer :level
      t.jsonb :damage, default: {}
      t.jsonb :dc
      t.jsonb :area_of_effect
      t.jsonb :school, default: {}
      t.jsonb :classes, default: {}
      t.jsonb :subclasses, default: {}

      t.timestamps
    end
  end
end
