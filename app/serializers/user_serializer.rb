class UserSerializer < ActiveModel::Serializer
  attributes :id, :favorite_food, :bio
  has_many :ingredients
end
