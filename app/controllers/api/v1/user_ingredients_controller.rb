class Api::V1::UserIngredientsController < ApplicationController

    def create

    end

    def destroy
        user_ingredient = UserIngredient.find(params[:id])
        user_ingredient.destroy
    end
end