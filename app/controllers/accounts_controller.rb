class AccountsController < ApplicationController
    def show 
        @account = Account.new
        @account.users.build
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            redirect_to root_path, notice: "Account Created"
        else
            render :show
        end
    end

    private

    def account_params
        params.require(:account).permit(:subdomain, users_attributes: [:email, :password, :password_confirmation])
    end
end
