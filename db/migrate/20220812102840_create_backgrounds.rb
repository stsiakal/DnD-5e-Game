class CreateBackgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :backgrounds do |t|
      t.string :index
      t.string :name
      t.jsonb :starting_proficiencies
      t.jsonb :language_options
      t.jsonb :starting_equipment
      t.jsonb :starting_equipment_options
      t.jsonb :feature
      t.jsonb :personality_traits
      t.jsonb :ideals
      t.jsonb :bonds
      t.jsonb :flaws

      t.timestamps
    end
  end
end
