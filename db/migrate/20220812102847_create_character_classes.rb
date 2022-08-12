class CreateCharacterClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :character_classes do |t|
      t.string :index
      t.string :name
      t.integer :hit_die
      t.jsonb :class_levels, default: {}
      t.jsonb :multi_classing, default: {}
      t.jsonb :spellcasting, default: {}
      t.jsonb :spells, default: {}
      t.jsonb :starting_equipment, default: {}
      t.jsonb :starting_equipment_options, default: {}
      t.jsonb :proficiency_choices
      t.jsonb :proficiencies
      t.jsonb :saving_throws
      t.jsonb :subclasses

      t.timestamps
    end
  end
end
