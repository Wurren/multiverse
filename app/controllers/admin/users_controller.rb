class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @current_account.users.invite!(user_params)
        redirect_to admin_users_path, notice: "New User Invited!"
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
