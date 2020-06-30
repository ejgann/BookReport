class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    # enables these helper methods to be used in the view files

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
        # returns current_user if already defined or find the user by id in the table if the user has been created already
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end
end
