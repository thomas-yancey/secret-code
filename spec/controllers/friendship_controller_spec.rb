require 'rails_helper'

describe FriendshipsController do
  let(:friendship){FactoryGirl.create(:friendship)}
  let(:user){FactoryGirl.create(:user)}
  let(:user_2){User.create(email: "Jonny@gmail.com", username: "jonny", password: "password", password_confirmation: "password")}

  before(:each) do
    sign_in user
  end

  context "#create" do
    it "creates a friend request" do
      request.env["HTTP_REFERER"] = friendships_path
      params = FactoryGirl.attributes_for(:friendship).merge(friend_id: user_2.id, user_id: user.id)
      post :create, friendship: params
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end
  end

end