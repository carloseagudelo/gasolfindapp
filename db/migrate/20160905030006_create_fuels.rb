class CreateFuels < ActiveRecord::Migration
  def change
    create_table :fuels do |t|
      t.references :fuelstation, index: true, foreign_key: true
      t.references :fuel_type, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
