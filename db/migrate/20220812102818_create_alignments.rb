class CreateAlignments < ActiveRecord::Migration[7.0]
  def change
    create_table :alignments do |t|
        t.string :index
        t.string :name
        t.text :desc
        t.string :abbreviation

      t.timestamps
    end
  end
end
