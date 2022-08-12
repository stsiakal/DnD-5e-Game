class CreateWeaponProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :weapon_properties do |t|
      t.string :index
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
