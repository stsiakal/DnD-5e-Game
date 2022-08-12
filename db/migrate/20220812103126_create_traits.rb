class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :index
      t.string :name
      t.string :desc
      t.jsonb :races, default: {}
      t.jsonb :subraces, default: {}
      t.jsonb :parent, default: {}
      t.jsonb :proficiencies, default: {}
      t.jsonb :proficiency_choices, default: {}
      t.jsonb :trait_specific, default: {}

      t.timestamps
    end
  end
end
