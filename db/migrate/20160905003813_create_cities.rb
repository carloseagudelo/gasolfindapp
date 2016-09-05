class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.references :country, index: true, foreign_key: true
      t.string :Name

      t.timestamps null: false
    end
  end
end
