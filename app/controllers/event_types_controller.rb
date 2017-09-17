class EventTypesController < ApplicationController
	def index
		@event_types = EventType.all
	end

	def show
		@event_type = EventType.find(params[:id]) or not_found
	end

	def new
		if admin_signed_in?
			@event_type = EventType.new
		else
			redirect_to home_index_path
		end
	end

	def edit
		@event_type = EventType.find(params[:id])
	end

	def create
		if admin_signed_in?
			@event_type = EventType.new(event_type_params)
			@event_type.save
			redirect_to @event_type
		else
			redirect_to home_index_path
		end
	end

	def update 
		if admin_signed_in?
	 		@event_type = EventType.find(params[:id])
 
  			if @event_type.update(event_type_params)
    			redirect_to @event_type
  			else
    			render 'edit'
  			end
		else
			redirect_to home_index_path
		end
	end

	def destroy
		if admin_signed_in?
			@event_type = EventType.find(params[:id])
  			@event_type.destroy
 
  			redirect_to event_types_path
		else
			redirect_to home_index_path
		end
  	end

  	private
  	def event_type_params
  		params.require(:event_type).permit(:name, :description, :minidescription, :avatar)
  	end
end
