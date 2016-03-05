class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user

  protected
  def ensure_login
    session[:return_to] ||= request.original_url
  	unless session[:user_id]
  		redirect_to login_path, alert: "You need to login first"
  	end
  end

  def logged_in?
  	session[:user_id]
  end

  def current_user
    id = logged_in?
    if id
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end