class UserSerializer < ActiveModel::Serializer
  attributes :id, :favorite_food, :bio, :username
  has_many :user_ingredients
end
