class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules do |t|
      t.string :index
      t.string :name
      t.string :desc
      t.jsonb :subsections

      t.timestamps
    end
  end
end
