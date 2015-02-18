require 'rails_helper'

describe Api::PostsController do

  before do
    @user = FactoryGirl.create(:user)
    @token = User.authorize(@user.email, '123456789', 0)['token']
  end

  describe 'response of API' do

    before do
      2.times{ FactoryGirl.create(:post, user_id: @user.id)}
      @params = {token: @token}
    end

    describe 'GET#index' do
      it 'returns json of Post data' do
        get :index, @params
        expect(response.body).to match_array(@user.posts.to_json)
      end
    end
  end

end