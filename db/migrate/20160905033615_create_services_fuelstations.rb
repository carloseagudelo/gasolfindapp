class CreateServicesFuelstations < ActiveRecord::Migration
  def change
    create_table :services_fuelstations, :id => false do |t|

      t.references :fuelstation, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
