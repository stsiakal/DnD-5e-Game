class CreateCharacterClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :character_classes do |t|
      t.string :index
      t.string :name
      t.integer :hit_die
      t.jsonb :class_levels, null: false, default: {}
      t.jsonb :multi_classing, null: false, default: {}
      t.jsonb :spellcasting, null: false, default: {}
      t.jsonb :spells, null: false, default: {}
      t.jsonb :starting_equipment, null: false, default: {}
      t.jsonb :starting_equipment_options, null: false, default: {}
      t.jsonb :proficiency_choises, null: false, default: {}
      t.jsonb :proficiencies, null: false, default: {}
      t.jsonb :saving_throws, null: false, default: {}
      t.jsonb :subclasses, null: false, default: {}

      t.timestamps null: false
    end
  end
end
