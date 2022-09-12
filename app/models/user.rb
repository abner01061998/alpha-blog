class User < ApplicationRecord
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
    
end