class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :Name
      t.string :Description

      t.timestamps null: false
    end
  end
end
