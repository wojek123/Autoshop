class Car < ActiveRecord::Base

	belongs_to :user
	has_many :galleries
	belongs_to :purchase
	scope :filtr_brand, -> (brand) {where('brand like ?', brand)}
	scope :price, ->(min,max) {where("price >= ? AND price <= ?", min, max)}
	scope :filtr_model, ->(model) {where('model like ?', model)}


	has_attached_file :photo, {:styles=>{:thumb => "200x150#",:ico=>"50x30#"}, 
		:url => "/system/:style/:hash.:extension",
		:hash_secret => "photo",
		:hash_data => ":class/:attachment/:id/:style/:created_at" 
	
	}
	self.inheritance_column = nil
	validates_attachment_content_type :photo, :content_type=>/\Aimage\/.*\z/

	

	def self.filter(*args)
		
	end

	#scope :cost ->(price_min,price_max){where(:price<=price_max, :price>=price_min )}
	#scope :eng ->(min, max){where(:engine<=max, :engine>=min )}
end
