class FixDatabaseCars < ActiveRecord::Migration
  def change
  	remove_column :cars, :milage
  	remove_column :cars, :power
  	remove_column :cars, :price
  	remove_column :cars, :engine
  	
  end
end
