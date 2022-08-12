class CreateAbilityScores < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_scores do |t|
      t.string :index
      t.string :name
      t.string :desc
      t.string :full_name
      t.jsonb :skills, default: {}

      t.timestamps
    end
  end
end
