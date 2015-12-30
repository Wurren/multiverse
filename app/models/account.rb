class Account < ActiveRecord::Base
    has_many :users
    accepts_nested_attributes_for :users

    validates :subdomain, presence: true
end
