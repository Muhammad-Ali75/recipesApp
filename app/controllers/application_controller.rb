class ApplicationController < ActionController::Base
   
    helper_method :current_chef, :logged_in?

    
    def current_chef
       @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
    end
    
    def logged_in?
        !!current_chef
    end

    def require_user
        unless logged_in?
            flash[:danger] = "Please log in"
            redirect_to login_path
    end
    
end
end
