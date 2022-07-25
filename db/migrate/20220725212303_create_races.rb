class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')
    create_table :races do |t|
      t.string :index
      t.string :name
      t.integer :speed
      t.text :ability_bonuses, array: true, default: []
      t.string :size
      t.text :size_description, array: true, default: []
      t.text :starting_proficiencies, array: true, default: []
      t.hstore :starting_proficiency_options
      t.text :languages, array: true, default: []
      t.text :language_description
      t.text :traits, array: true, default: []
      t.text :subraces, array: true, default: []
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
