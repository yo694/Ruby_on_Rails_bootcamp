module JwtAuthenticatable
  def authenticate_user_from_token
    auth_header = request.headers["Authorization"]

    # Case 1: Authorization header is missing
    unless auth_header
      render json: { error: "Unauthorized" }, status: :unauthorized
      return
    end

    token = auth_header.split(" ").last

    begin
      # Try to decode and verify the JWT
      decoded_token = JWT.decode(
        token,
        Rails.application.secret_key_base,
        true,
        algorithm: "HS256"
      )

      # Get user from token
      user_id = decoded_token[0]["user_id"]
      user = User.find(user_id)

      @current_user = user

    rescue JWT::DecodeError
      # Case 2: Token exists but is invalid/expired
      render json: { error: "Invalid or expired token" },
             status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end