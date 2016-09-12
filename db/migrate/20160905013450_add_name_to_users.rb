class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :age, :string
    add_reference :users, :city, index: true, foreign_key: true
    add_column :users, :adress, :string
    add_column :users, :description, :string
    add_reference :users, :vehicle, index: true, foreign_key: true
  end
end
