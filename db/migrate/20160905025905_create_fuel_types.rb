class CreateFuelTypes < ActiveRecord::Migration
  def change
    create_table :fuel_types do |t|
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
