module ApplicationHelper
    def email_domain
        if Rails.env.production?
            "myproduction.com"
        else  
            'lvh.me'
        end
    end
end
