class User < ApplicationRecord
    has_secure_password
    
    has_many :user_ingredients, dependent: :destroy
    has_many :ingredients, through: :user_ingredients

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 6}, if: -> {new_record? || !password.nil?}
end
