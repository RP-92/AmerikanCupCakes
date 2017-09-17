class PhotosController < ApplicationController
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
		if admin_signed_in?
			@photo = Photo.new
		else
			redirect_to home_index_path
		end
	end

	def edit
		@photo = Photo.find(params[:id])
	end

	def create
		if admin_signed_in?
			@photo = Photo.new(photo_params)
			@photo.save
			redirect_to photos_path
		else
			redirect_to home_index_path
		end
	end

	def update 
		if admin_signed_in?
	 		@photo = Photo.find(params[:id])
 
  			if @photo.update(photo_params)
    			redirect_to @photo
  			else
    			render 'edit'
  			end
		else
			redirect_to home_index_path
		end
	end

	def destroy
		if admin_signed_in?
			@photo = Photo.find(params[:id])
  			@photo.destroy
 
  			redirect_to photos_path
		else
			redirect_to home_index_path
		end
  	end

  	private
  	def photo_params
  		params.require(:photo).permit(:picture)
  	end
end