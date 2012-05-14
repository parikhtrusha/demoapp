class ApplicationController < ActionController::Base
  protect_from_forgery
  
 
 # before_filter :set_current_user  
 # before_filter :login_required
  protected
  def set_current_user
    if session[:user_id] 
           @current_user = User.find(session[:user_id])
       else
           @current_user = nil
       end
  end

  			def authenticate_user!
  			if @current_user.nil?
		    flash[:alert] = "You must be an admin to do that."
    		redirect_to root_path
  		end
	end
	
end
