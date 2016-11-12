class CreateFueltypeFuelstation < ActiveRecord::Migration
  def change
    create_table :fueltype_fuelstation, :id => false do |t|

      t.references :fuelstation, index: true, foreign_key: true
      t.references :fueltype, index: true, foreign_key: true      

      t.timestamps null: false
    end
  end
end
