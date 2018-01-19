class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  def sign_in(user)
    user.remember
    cookies.permanent[:remember_token] = user.remember_token
    current_user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def sign_out
    @current_user = nil
  end
  
  def logged_in?
    !current_user.nil?
  end

end
