class GalleriesController < ApplicationController
	def index
		@galleries = Gallery.all.where(car_id: params[:id])
	end

	def new
		@galleries = Gallery.new
	end

	def show
		@galleries = Gallery.find(params[:id])
 	end	

	def create
		gallery_params.each{|img| 
			gallery_for_car=Gallery.new(img: img, car_id: params[:id])
			gallery_for_car.save
		}
		  redirect_to galleries_path(params[:id])
	end


	private
		def gallery_params
			params[:gallery][:img]
		end
end