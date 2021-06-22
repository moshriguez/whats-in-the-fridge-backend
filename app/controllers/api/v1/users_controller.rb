class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :usernames]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    
    def update
        user = @current_user.update(user_params)
        if user
            render json: {user: UserSerializer.new(@current_user)}, status: :accepted
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def destroy
        @current_user.destroy
    end

    def usernames
        render json: {usernames: User.all.map{|u| u.username}}
    end

    private

    def user_params
        params.permit(:username, :password, :bio, :favorite_food)
    end
end
