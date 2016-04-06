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
  end

  context "index" do
    it "should stop users from visiting index page without a message id" do
      sign_in @user
      get :index, receiver_id: @user
      expect(response).to redirect_to(root_path)
    end
  end

end
