class CreateFuelstations < ActiveRecord::Migration
  def change
    create_table :fuelstations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :link
      t.string :horary
      t.string :responsable

      t.timestamps null: false
    end
  end
end
