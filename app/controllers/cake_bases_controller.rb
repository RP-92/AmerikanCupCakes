class CakeBasesController < ApplicationController
	

	def index
		@cakebases = CakeBase.all
	end

	def show
		@cakebase = CakeBase.find(params[:id])
	end

	def new
		if admin_signed_in?
			@cakebase = CakeBase.new
		else
			redirect_to home_index_path
		end
	end

	def create
		if admin_signed_in?
			@cakebase = CakeBase.new(cakebase_params)
			@cakebase.save
			redirect_to cake_bases_path
		else
			redirect_to home_index_path
		end
	end

	def edit
		@cakebase = CakeBase.find(params[:id])
	end

	def update 
		if admin_signed_in?
	 		@cakebase = CakeBase.find(params[:id])
 
  			if @cakebase.update(cakebase_params)
    			redirect_to cake_bases_path
  			else
    			render 'edit'
  			end
		else
			redirect_to home_index_path
		end
	end

	def destroy
		if admin_signed_in?
			@cakebase = CakeBase.find(params[:id])
  			@cakebase.destroy
 
  			redirect_to cake_bases_path
		else
			redirect_to home_index_path
		end
  	end

  	private
  	def cakebase_params
  		params.require(:cake_base).permit(:name)
  	end
end
