class Api::V1::IngredientsController < ApplicationController
    skip_before_action :authorized

    def index
        ingredients = Ingredient.all.select("id, name, description")
        render json: {ingredients: ingredients}
    end
end
