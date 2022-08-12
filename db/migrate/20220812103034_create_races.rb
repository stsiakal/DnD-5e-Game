class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :index
      t.string :name
      t.integer :speed
      t.jsonb :ability_bonuses, default: {}
      t.string :alignment
      t.string :age
      t.string :size
      t.jsonb :size_description, default: {}
      t.jsonb :starting_proficiencies, default: {}
      t.jsonb :starting_proficiency_options, default: {}
      t.jsonb :languages, default: {}
      t.jsonb :language_description, default: {}
      t.jsonb :traits, default: {}
      t.jsonb :subraces, default: {}

      t.timestamps
    end
  end
end
