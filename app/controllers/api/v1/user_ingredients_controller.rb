class Api::V1::IngredientsController < ApplicationController

    def create

    end

    def destroy
        user_ingredient = UserIngredient.find(params[:id])
        user_ingredient.destroy
    end
end