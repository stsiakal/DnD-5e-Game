class CreateProficiencies < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiencies do |t|
      t.string :index
      t.string :name
      t.string :type
      t.jsonb :classes, default: {}
      t.jsonb :races, default: {}
      t.jsonb :reference, default: {}

      t.timestamps
    end
  end
end
