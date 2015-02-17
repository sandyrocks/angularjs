class User < ActiveRecord::Base
  def self.authorize(email,password,auth_type)
    @user = User.find_by(email: email, password_hash: password)
    if auth_type == 1
      @user ||= User.create(email: email, password_hash: password)
      return {"token" => generate_valid_tokens(@user), "username" => @user.email}
    else
      return (@user.present?) ? {"token" => generate_valid_tokens(@user), "username" => @user.email} : {:message => "Invalid Username/Password"}
    end
  end

  def self.generate_valid_tokens(user)
    @token = JWT.encode({user.id.to_s => user.email.to_s}, "secret")
  end

end


