class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.integer :car_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
