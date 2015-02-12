class User < ActiveRecord::Base
  def self.authorize(email,password)
    if email.present? && password.present?
      @user = User.find_by(email: email, password_hash: password)
      @user ||= User.create(email: email, password_hash: password)
      return generate_valid_tokens(@user)
    else
       {"Message" => "Invalid Credentials"}
    end
  end

  def self.generate_valid_tokens(user)
    @token = JWT.encode({user.id.to_s => user.email.to_s}, "secret")
  end

end


