

class ApplicationController < ActionController::Base
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  # Add a before_action to authenticate all requests.
  # Move this to subclassed controllers if you only
  # want to authenticate certain methods.
  before_action :authenticate

  protected

  def json_request?
    request.format.json?
  end

  # Authenticate the user with token based authentication
  def authenticate
   authenticate_token || render_unauthorized
  end

  def authenticate_token
   authenticate_with_http_token do |token, options|
     @current_user = User.find_by(api_key: token)
   end
  end

  def render_unauthorized(realm = "Application")
   self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
   render json: 'Bad credentials', status: :unauthorized
  end


end
