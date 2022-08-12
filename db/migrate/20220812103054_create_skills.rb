class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :ability_score, null: false, default: {}

      t.timestamps
    end
  end
end
