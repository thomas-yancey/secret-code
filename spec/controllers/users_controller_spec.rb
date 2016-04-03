require 'rails_helper'

describe UsersController do
  render_views

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
      get :show, id: @user
      expect(response).to be_successful
    end
  end

end
