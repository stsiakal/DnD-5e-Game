class CreateSubraces < ActiveRecord::Migration[7.0]
  def change
    create_table :subraces do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :race
      t.jsonb :ability_bonuses
      t.jsonb :starting_proficiencies
      t.jsonb :languages
      t.jsonb :language_options
      t.jsonb :racial_traits

      t.timestamps
    end
  end
end
