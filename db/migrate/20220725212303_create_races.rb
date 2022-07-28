class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.string :index
      t.string :name
      t.integer :speed
      t.jsonb :ability_bonuses, null: false, default: {}
      t.string :alignment
      t.string :age
      t.string :size
      t.jsonb :size_description, null: false, default: {}
      t.jsonb :starting_proficiencies, null: false, default: {}
      t.jsonb :starting_proficiency_options
      t.jsonb :languages, null: false, default: {}
      t.jsonb :language_description, null: false, default: {}
      t.jsonb :traits, null: false, default: {}
      t.jsonb :subraces, null: false, default: {}

      t.timestamps null: false
    end
  end
end
