class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
    @user ||= User.where("id=?",session[:user_id]).first
  end
  helper_method :current_user

  protect_from_forgery with: :exception
end
