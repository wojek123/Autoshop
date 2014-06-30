class AddAttachmentImgToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :img
    end
  end

  def self.down
    drop_attached_file :galleries, :img
  end
end
