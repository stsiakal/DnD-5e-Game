class CreateMonsters < ActiveRecord::Migration[7.0]
  def change
    create_table :monsters do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.integer :charisma
      t.integer :constitution
      t.integer :dexterity
      t.integer :intelligence
      t.integer :strength
      t.integer :wisdom
      t.text :size
      t.string :type
      t.string :subtype
      t.text :alignment
      t.integer :armor_class
      t.integer :hit_points
      t.string :hit_dice
      t.jsonb :actions, default: {}
      t.jsonb :legendary_actions, default: {}
      t.integer :challenge_rating
      t.jsonb :condition_immunities, default: {}
      t.string :damage_immunities
      t.string :damage_resistances
      t.string :damage_vulnerabilities
      t.jsonb :forms, default: {}
      t.string :languages
      t.jsonb :proficiencies, default: {}
      t.jsonb :reactions, default: {}
      t.jsonb :senses, default: {}
      t.jsonb :special_abilities, default: {}
      t.jsonb :speed, default: {}
      t.integer :xp

      t.timestamps
    end
  end
end
