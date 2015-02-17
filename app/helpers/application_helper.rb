module ApplicationHelper
  def is_valid_jwt_token?(token)
    decoded_data = JWT.decode(token, nil, false) rescue ""
    if decoded_data.present?
      user_id = decoded_data.first.keys.first.to_i
      @user = User.find_by_id(user_id)
      return (@user.email == decoded_data.first[user_id.to_s]) ? true : false
    end
  end

end
