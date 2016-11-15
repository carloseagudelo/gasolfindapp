class CreatePhotofuelstations < ActiveRecord::Migration
  def change
    create_table :photofuelstations do |t|

      t.references :fuelstation, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
