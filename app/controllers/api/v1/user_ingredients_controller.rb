class Api::V1::UserIngredientsController < ApplicationController

    def create
        user_ingredient = UserIngredient.new(user_ingredient_params)
        if user_ingredient.save
            render json: {user_ingredient: UserIngredientSerializer.new(user_ingredient)}, status: :created
        else
            render json: {error: "You already have that ingredient in your fridge!"}, status: :unprocessable_entity
        end
    end

    def destroy
        user_ingredient = UserIngredient.find(params[:id])
        user_ingredient.destroy
        render json: {user_ingredient: user_ingredient}, status: :accepted
    end

    private

    def user_ingredient_params
        params.permit(:user_id, :ingredient_id)
    end
end