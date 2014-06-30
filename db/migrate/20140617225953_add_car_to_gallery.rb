class AddCarToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :car_id, :integer
  end
end
