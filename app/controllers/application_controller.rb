class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Exception, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_found

  def raise_not_found
  	raise ActionController::RoutingError.new('Not Found')
  end

  def not_found
  	respond_to do |format|
  		format.html { render file: "#{Rails.root}/public/404", status: :not_found }
  		format.xml { head :not_found }
  		format.any { head :not_found }
  	end
  end
end