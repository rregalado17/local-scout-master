class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?

    def logged_in?
        !!current_user
    end
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]   
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end

end
