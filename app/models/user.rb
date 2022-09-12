class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :username, 
        presence: true, 
        length: {minimum: 3, maximum:25 }, 
        uniqueness: { case_sensitive: false }
        
    EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true, 
        length: { minimum: 5, maximum:100 }, 
        uniqueness: { case_sensitive: false },
        format: { with: EMAIL_REGEXP }

    before_save {
        self.username = username.downcase
        self.email = email.downcase
    }

    has_secure_password

    
end