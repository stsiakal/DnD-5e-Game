class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :prerequisites

      t.timestamps
    end
  end
end
