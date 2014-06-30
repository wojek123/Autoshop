class Gallery < ActiveRecord::Base
	belongs_to :car
	#validations
	#validates 	:car , presence: true
	# Photo uploader using carrierwave
    #has_many :imgs, as:im
    has_attached_file :img, {:styles=>{:thumb => "200x150#",:ico=>"50x30#"}, 
		:url => "/system/:style/:hash.:extension",
		:hash_secret => "img",
		:hash_data => ":class/:attachment/:id/:style/:created_at" 
	}

	
	validates_attachment_content_type :img, :content_type=>/\Aimage\/.*\z/
end
