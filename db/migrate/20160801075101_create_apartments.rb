class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :name, null: false
      t.integer :rent, null: false
      t.string :address, null: false
      t.integer :building_age, null: false
      t.text :note

      t.timestamps
    end
  end
end
