class Api::V1::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end