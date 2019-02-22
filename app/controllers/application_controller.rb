class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  protected

  def authorize
    if request.format == Mime[:html]
      unless User.count.zero? || User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please login'
      end
    else
      authenticate_or_request_with_http_basic do |username, password|
        user = User.find_by(name: username)
        user && user.authenticate(password)
      end
    end
  end
end
