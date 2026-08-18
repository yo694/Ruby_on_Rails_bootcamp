module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :verify_authenticity_token
      #skip_after_action :verify_authorized

      def login
        email = params[:email]
        password = params[:password]

        user = User.find_by(email: email)

        if user && user.valid_password?(password)
          payload = {
            user_id: user.id,
            exp: 24.hours.from_now.to_i
          }

          token = JWT.encode(payload, Rails.application.secret_key_base)

          render json: { token: token }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

    end
  end
end