class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #Authorize tokens in order to server the posts api
  def authorize_valid_tokens
    unless is_valid_jwt_token?(params[:token])
      render json: {:message => "Invalid Tokens"}
    end
  end
end
