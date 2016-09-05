class CreateServicesFuelStations < ActiveRecord::Migration
  def change
    create_table :services_fuel_stations do |t|
      t.references :fuelstation, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
