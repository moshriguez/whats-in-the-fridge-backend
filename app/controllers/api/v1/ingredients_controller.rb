class Api::V1::IngredientsController < ApplicationController
    skip_before_action :authorized


    def index
        ingredients = Ingredient.all
        render json: {ingredients: ingredients}
    end
end
