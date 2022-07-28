class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :index
      t.string :name
      t.text :desc, array: true, default: []
      t.integer :charisma
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :strength
      t.integer :wisdom
      t.text :size, array: true, default: []
      t.string :type
      t.string :subtype
      t.text :alignments, array: true, default: []
      t.integer :armor_class
      t.integer :hit_points
      t.string :hit_dice
      t.jsonb :actions, null: false, default: {}
      t.jsonb :legendary_actions, null: false, default: {}
      t.integer :challenge_rating
      t.jsonb :condition_immunities, null: false, default: {}
      t.string :damage_immunities, array: true, default: []
      t.string :damage_resistances, array: true, default: []
      t.string :damage_vulnerabilities, array: true, default: []
      t.jsonb :forms, null: false, default: {}
      t.string :languages
      t.jsonb :proficiencies, null: false, default: {}
      t.jsonb :reactions, null: false, default: {}
      t.jsonb :senses, null: false, default: {}
      t.jsonb :special_abilities, null: false, default: {}
      t.jsonb :speed, null: false, default: {}
      t.integer :xp

      t.timestamps null: false
    end
  end
end
