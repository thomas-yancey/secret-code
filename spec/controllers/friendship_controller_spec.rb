require 'rails_helper'

describe FriendshipsController do

  context "#create" do
    it "creates a friend request" do
      user = FactoryGirl.create(:user)
      sign_in user      
      user_2 = User.create(email: "Jonny@gmail.com", username: "jonny", password: "password", password_confirmation: "password")
      friend = FactoryGirl.create(:friendship)
      request.env["HTTP_REFERER"] = friendships_path
      params = FactoryGirl.attributes_for(:friendship).merge(friend_id: user_2.id, user_id: user.id)
      post :create, friendship: params
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end

    it "redirects back on a failed attempt" do
      user = FactoryGirl.create(:user)
      sign_in user
      user_2 = User.create(email: "Jonny@gmail.com", username: "jonny", password: "password", password_confirmation: "password")
      friend = FactoryGirl.create(:friendship)
      request.env["HTTP_REFERER"] = friendships_path
      params = FactoryGirl.attributes_for(:friendship)
      post :create, friendship: params
      expect(flash[:notice]).to eq "Unable to send friend request."     
    end
  end

  context "#update" do
    it "should create a friendship object if accepted" do
     request.env["HTTP_REFERER"] = friendships_path
      user = FactoryGirl.create(:user)
      sign_in user
      user_2 = User.create(email: "Jonny2@gmail.com", username: "jonny", password: "password", password_confirmation: "password")
      friendship = Friendship.create(user_id: user_2.id, friend_id: user.id)
      patch :update, id: friendship.user_id, friend_id: user.id
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end
  end

  context "#destroy" do
    it "removes a friend from your friend list" do
      request.env["HTTP_REFERER"] = friendships_path
      user = FactoryGirl.create(:user)
      sign_in user
      user_2 = User.create(email: "Jonny2@gmail.com", username: "jonny", password: "password", password_confirmation: "password")
      friendship = Friendship.create(user_id: user_2.id, friend_id: user.id)
      delete :destroy, id: friendship.user_id, friend_id: user.id
      expect(flash[:notice]).to eq "You have removed that friend."
    end
  end

  context "#index" do
    it "shows a page with all available users to friend" do
      user = FactoryGirl.create(:user)      
      sign_in user
      get :index
      expect(response).to render_template("friendships/index")
    end
  end

end