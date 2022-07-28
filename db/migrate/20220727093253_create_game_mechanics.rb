class CreateGameMechanics < ActiveRecord::Migration[7.0]
  def change
    create_table :game_mechanics do |t|
      t.jsonb :conditions, null: false, default: {}
      t.jsonb :damage_types, null: false, default: {}
      t.jsonb :magic_schools, null: false, default: {}
      t.jsonb :feats, null: false, default: {}
      t.jsonb :features, null: false, default: {}
      t.jsonb :rule_sections, null: false, default: {}
      t.jsonb :rules, null: false, default: {}
      t.jsonb :traits, null: false, default: {}

      t.timestamps null: false
    end
  end
end
