class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: { minimum:3, maximum:30}, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password
end
