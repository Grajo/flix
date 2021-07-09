class ApplicationController < ActionController::Base

private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # by declaring it as a helper method too, 
    # then the method is available in the views.
    helper_method :current_user

    def current_user_already_signed_in?(user)
        current_user == user
    end

    helper_method :current_user_already_signed_in?

    def current_user_admin?
        current_user && current_user.admin?
    end

    helper_method :current_user_admin?

    def require_signin
        unless current_user
            session[:intended_url] = request.url
            redirect_to new_session_url, alert: "Please sign in first!"
        end
    end

    def require_admin
        unless current_user_admin?
            session[:intended_url] = request.url
            redirect_to new_session_url, alert: "Unauthorized user!"
        end
    end
end
