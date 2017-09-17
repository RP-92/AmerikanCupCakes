class OrdersController < ApplicationController
	helper_method :take,  :deliver, :renew, :reject

	def take
		@order = Order.find(params[:id])
		@order.status = "Tomada"
		@order.save
		redirect_to orders_path
	end

	def deliver
		@order = Order.find(params[:id])
		@order.status = "Entregada"
		@order.save
		redirect_to orders_path
	end

	def renew
		@order = Order.find(params[:id])
		@order.status = "Nueva"
		@order.save
		redirect_to orders_path
	end

	def reject
		@order = Order.find(params[:id])
		@order.status = "Rechazada"
		@order.save
		redirect_to orders_path
	end

	def index
		if admin_signed_in?
			@orders = Order.all
			if params[:search]
    			@orders = Order.search(params[:search]).order("created_at DESC").page(params[:page]).per(15)
  			else
    			@orders = Order.all.order('created_at DESC').page(params[:page]).per(15)
  			end
		else
			redirect_to home_index_path
		end
	end

	def show
		if admin_signed_in?
			@order = Order.find(params[:id])
			if @order.status == "Nueva"
				@order.status = "Vista"
				@order.save
			end
		else
			redirect_to home_index_path
		end
	end

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.status = "Nueva"

		if @order.cake_base_id != 1 && @order.cake_base_id != nil
			@cake_base = CakeBase.find(@order.cake_base_id)
			@order.cake_base_name =  @cake_base.name
		end
		if @order.cake_base_id == nil
			@order.cake_base_name =  "Vacío"
		end

		if @order.cake_filling_id != 1 && @order.cake_base_id != nil
			@cake_filling = CakeFilling.find(@order.cake_filling_id)
			@order.cake_filling_name = @cake_filling.name
		end
		if @order.cake_filling_id == nil
			@order.cake_filling_name = "Vacío"
		end

		if @order.save
			redirect_to @order
		else
			render 'new'
		end
	end

	def destroy
		@order = Order.find(params[:id])
  		@order.destroy
 
  		redirect_to orders_path
  	end

	private
	def order_params
		params.require(:order).permit(:name, :phone, :email, :description, :date, :cake_base_name, :cake_base_id, :cake_filling_name, :cake_filling_id, :attendants)
	end
end
