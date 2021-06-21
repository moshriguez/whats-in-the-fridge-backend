class ApplicationController < ActionController::API
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

    before_action :authorized

    def encode_token(payload, exp = 3.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def decoded_token
        header = request.headers["Authorization"]
        token = header.split(" ")[1] if header
        begin
            JWT.decode(token, SECRET_KEY)[0]
        rescue JWT::DecodeError
            nil
        end
    end

    def authorized
        current_user = User.find(decoded_token["user_id"]) if decoded_token
        render json: {message: "Log in to continue"}, status: :unauthorized unless !!current_user
    end
end
