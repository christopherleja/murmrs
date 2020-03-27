class ApplicationController < ActionController::Base

    protect_from_forgery

    before_action :confirm_login
    before_action :setup_notifications
    before_action :ensure_authenticated

    def confirm_login
        @logged_in = !!logged_in_user_id
        current_user if @logged_in
    end

    def setup_notifications
        @errors = flash[:errors]
    end

    def current_user
        @current_user ||= User.find(current_user_id) if current_user_id
    end

    helper_method :current_user

    def current_user_id
        session[:user_id]
    end

    private

    def ensure_authenticated
        unless logged_in?
            flash[:errors] = ["You must be logged in to do that"]
            redirect_to new_login_path
        end
    end
    
    def logged_in?
        !!logged_in_user_id
    end

    def logged_in_user_id
        session[:user_id]
    end

    def log_in_user(user_id)
        session[:user_id] = user_id
    end

    def log_out_user
        session[:user_id] = nil
    end
end
