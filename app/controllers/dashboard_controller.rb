class DashboardController < ApplicationController
    #include Secured
    before_action :authenticate_user!

    def show
        @user=@current_user
    end
end
