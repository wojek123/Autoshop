class AddMilalgeToCars < ActiveRecord::Migration
  def change
  	add_column :cars, :milage , :integer
  	add_column :cars, :power , :integer
  	add_column :cars, :price, :decimal, :precision => 8, :scale => 2
  	add_column :cars, :engine, :integer
  end
end
