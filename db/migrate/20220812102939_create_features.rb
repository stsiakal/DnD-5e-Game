class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.integer :level
      t.jsonb :classes
      t.jsonb :prerequisites
      t.jsonb :subclass
      t.jsonb :feature_specific

      t.timestamps
    end
  end
end
