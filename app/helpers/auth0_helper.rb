module Auth0Helper
    private
    def user_signed_in?
        session[:userinfo].present?
    end

    def authenticate_user!
        if user_signed_in?
            @auth0_user=session[:userinfo]
            email_id=@auth0_user["info"]["email"]
            @current_user=User.find_or_create_by!(email: email_id)
            @current_user.info=@auth0_user["info"]
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
