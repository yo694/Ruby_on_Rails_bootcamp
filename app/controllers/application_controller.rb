class ApplicationController < ActionController::Base

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(_resource)
    books_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  private

  def user_not_authorized
    render json: { error: "Forbidden" }, status: :forbidden
  end

end