class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :subdomain, :current_account
    before_filter :validate_subdomain


    def after_sign_in_path_for(resource)
        admin_dashboard_path
    end

    private # ----------------------------------------------------

    def current_account
        @current_account ||= Account.where(subdomain: subdomain).first
    end

    def subdomain
        request.subdomain
    end

    def validate_subdomain
        unless subdomain.empty?
            redirect_to "/404" if current_account.nil?
        end
    end
end
