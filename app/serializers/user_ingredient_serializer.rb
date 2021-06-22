class UserIngredientSerializer < ActiveModel::Serializer
    attributes :id, :ingredient
    belongs_to :ingredient

    def ingredient
      Ingredient.select("id, name").find(object.ingredient_id)
    end
  end
  