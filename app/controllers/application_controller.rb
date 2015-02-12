class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :generate_valid_tokens
  
  def generate_valid_tokens
  	#implement the token functionality 
  end
end
