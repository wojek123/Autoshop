class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :milage
      t.string :gearcase
      t.string :type
      t.string :fuel
      t.integer :doors
      t.string :stan
      t.boolean :broken
      t.string :color
      t.integer :power
      t.text :description
      t.text :info
      t.text :equipment
      t.float :price
      t.timestamps
    end
  end
end
