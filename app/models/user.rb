class User < ApplicationRecord
    has_secure_password
    
    has_many :user_ingredients
    has_many :ingredients, through: :user_ingredients

    validates :username, uniqueness: { case_sensitive: false }
end
