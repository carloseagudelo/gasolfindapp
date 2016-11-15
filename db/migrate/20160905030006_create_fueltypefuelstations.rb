class CreateFueltypefuelstations < ActiveRecord::Migration
  def change
    create_table :fueltypefuelstations do |t|

      t.references :fuelstation, index: true, foreign_key: true
      t.references :fueltype, index: true, foreign_key: true      

      t.timestamps null: false
    end
  end
end
