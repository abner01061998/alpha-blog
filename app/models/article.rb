class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 6, maximum:100 }, uniqueness: true
    validates :description, presence: true, length: {minimum: 10, maximum:1000 }
end