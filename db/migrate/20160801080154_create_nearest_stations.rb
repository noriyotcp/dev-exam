class CreateNearestStations < ActiveRecord::Migration[5.0]
  def change
    create_table :nearest_stations do |t|
      t.string :line
      t.string :name
      t.integer :minutes_walk
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
