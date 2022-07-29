class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :index
      t.string :name
      t.string :desc, array: true, default: []
      t.jsonb :races, null: false, default: {}
      t.jsonb :subraces, null: false, default: {}
      t.jsonb :proficiencies, null: false, default: {}
      t.jsonb :proficiency_choices, null: false, default: {}
      t.jsonb :trait_specific, null: false, default: {}

      t.timestamps null: false
    end
  end
end
