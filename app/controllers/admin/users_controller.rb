class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        if params[:user][:email].blank? 
            return redirect_to new_admin_user_path, alert: "You Must Enter an Email Address!"
        end
        @current_account.users.invite!(user_params)
        redirect_to admin_users_path, notice: "New User Invited!"
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
