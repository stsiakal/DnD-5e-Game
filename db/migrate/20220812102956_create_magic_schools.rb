class CreateMagicSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_schools do |t|
      t.string :index
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
