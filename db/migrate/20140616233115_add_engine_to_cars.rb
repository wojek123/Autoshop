class AddEngineToCars < ActiveRecord::Migration
  def change
    add_column :cars, :engine, :string
  end
end
