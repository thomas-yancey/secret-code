require 'rails_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  context "login" do
    it "should reject invalid login credentials" do
      user = User.create(email:"jonny@gmail.com")
      expect(user).to be_invalid
    end

    it "should accept valid login credentials" do
      expect(@user).to be_valid
    end

    it "should have a current user" do
      sign_in @user
      get :show, id: @user
      expect(response).to be_successful
    end

    it "should get a user's received_messages" do
      sign_in @user
      get :received_messages, id: @user
      expect(response).to render_template("users/received_messages")
    end

    it "should get a user's friend requests" do
      sign_in @user
      get :requested_friendships, id: @user
      expect(response).to render_template("users/requested_friendships")
    end

    it "should redirect to the user's profile page if they try to visit another user's page" do
      sign_in @user
      user_2 = User.create(email: "jon2@gmail.com", username: "jonny22", password: "password", password_confirmation: "password")
      get :show, id: user_2.id
      expect(response).to redirect_to(user_path(@user))
    end

  end

end
