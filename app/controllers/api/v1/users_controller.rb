class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
            render json: {error: ""}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :bio)
    end
end
