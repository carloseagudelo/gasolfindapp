class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Name, :string
    add_column :users, :LastName, :string
    add_column :users, :Age, :string
    add_reference :users, :city, index: true, foreign_key: true
    add_column :users, :Adress, :string
    add_column :users, :description, :string
    add_reference :users, :vehicle, index: true, foreign_key: true
  end
end
