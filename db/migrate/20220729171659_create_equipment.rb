class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.jsonb :categories, null: false, default: {}

      t.timestamps null: false
    end
  end
end
