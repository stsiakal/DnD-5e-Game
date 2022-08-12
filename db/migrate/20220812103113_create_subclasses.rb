class CreateSubclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :subclasses do |t|
      t.string :index
      t.string :name
      t.text :desc
      t.jsonb :classes
      t.string :subclass_flavor
      t.jsonb :subclass_levels
      t.jsonb :features
      t.jsonb :spells

      t.timestamps
    end
  end
end
