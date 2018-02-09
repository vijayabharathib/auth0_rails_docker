module Auth0Helper
    private
    def user_signed_in?
        session[:userinfo].present?
    end

    def authenticate_user!
        if user_signed_in?
            @current_user=session[:userinfo]
        else
            redirect_to login_path
        end
    end

    def current_user
        @current_user
    end

    def login_path
        root_path
    end
end
