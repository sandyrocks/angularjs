class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #Authorize tokens in order to server the posts api
  def authorize_valid_tokens
    decoded_data = JWT.decode(params[:token], nil, false) rescue ""
    if decoded_data.present?
      user_id = decoded_data.first.keys.first.to_i
      user = User.find_by_id(user_id)
      unless user.email == decoded_data.first[user_id.to_s]
        render json: {:message => "Invalid Tokens"}
      end
    else
      render json: {:message => "Invalid Tokens"}
    end
  end
end
