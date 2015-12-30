Rails.application.routes.draw do

    skip_these = [:sessions, :passwords, :confirmations, :registrations, :invitation]

    constraints subdomain: false do
        root 'home#index'
        resource :accounts, path: "signup"
    end

    constraints subdomain: /.+/ do

        root to: redirect("admin/dashboard"), as: :admin_root

        devise_for :users, skip: skip_these
        as :user do
            get   '/login'  => 'devise/sessions#new',     as: 'new_user_session'
            post  '/login'  => 'devise/sessions#create',  as: 'user_session'
            get   '/logout' => 'devise/sessions#destroy', as: 'destroy_user_session'
            get   '/reset-password'        => 'devise/passwords#new',    as: 'new_user_password'
            put   '/reset-password'        => 'devise/passwords#update', as: 'user_password'
            post  '/reset-password'        => 'devise/passwords#create'
            get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_user_password'
        end

        get 'admin/dashboard', to: "admin/dashboard#index"

    end

end
