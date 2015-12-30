class User < ActiveRecord::Base
    devise  :database_authenticatable, 
            :registerable, 
            :recoverable, 
            :rememberable, 
            :trackable, 
            :basecamper

    belongs_to :account

    validates_presence_of   :email, if: :email_required?
    validates_uniqueness_of :email, allow_blank: true, if: :email_changed?, scope: :account_id
    validates_format_of     :email, with: Devise.email_regexp, allow_blank: true, if: :email_changed?

    validates_presence_of     :password, if: :password_required?
    validates_confirmation_of :password, if: :password_required?
    validates_length_of       :password, within: Devise.password_length, allow_blank: true

    protected #=====================

    def password_required?
        !persisted? || !password.nil? || !password_confirmation.nil?
    end

    def email_required?
        true
    end
end
