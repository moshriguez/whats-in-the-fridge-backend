class UserIngredientSerializer < ActiveModel::Serializer
    attributes :id, :ingredient
    belongs_to :ingredient
  end
  