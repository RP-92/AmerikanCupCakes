class CakeFillingsController < ApplicationController
	

	def index
		@cakefillings = CakeFilling.all
	end

	def show
		@cakefilling = CakeFilling.find(params[:id])
	end

	def new
		if admin_signed_in?
			@cakefilling = CakeFilling.new
		else
			redirect_to home_index_path
		end
	end

	def create
		if admin_signed_in?
			@cakefilling = CakeFilling.new(cakefilling_params)
			@cakefilling.save
			redirect_to cake_fillings_path
		else
			redirect_to home_index_path
		end
	end

	def edit
		@cakefilling = CakeFilling.find(params[:id])
	end

	def update 
		if admin_signed_in?
	 		@cakefilling = CakeFilling.find(params[:id])
 
  			if @cakefilling.update(cakefilling_params)
    			redirect_to cake_fillings_path
  			else
    			render 'edit'
  			end
		else
			redirect_to home_index_path
		end
	end

	def destroy
		if admin_signed_in?
			@cakefilling = CakeFilling.find(params[:id])
  			@cakefilling.destroy
 
  			redirect_to cake_fillings_path
		else
			redirect_to home_index_path
		end
  	end

  	private
  	def cakefilling_params
  		params.require(:cake_filling).permit(:name)
  	end
end
