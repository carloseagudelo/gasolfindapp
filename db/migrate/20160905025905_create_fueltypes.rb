class CreateFueltypes < ActiveRecord::Migration
  def change
    create_table :fueltypes do |t|
    	
      t.string :name
      t.float :price
      t.string :description

      t.timestamps null: false
    end
  end
end
