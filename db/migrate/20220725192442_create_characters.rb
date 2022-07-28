class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.integer :level
      t.jsonb :ability_scores, null: false, default: {}
      t.jsonb :race, null: false, default: {}
      t.jsonb :character_class, null: false, default: {}
      t.jsonb :alignment, null: false, default: {}
      t.jsonb :background, null: false, default: {}
      t.references :user, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
