require 'rails_helper'

describe SecretsController do
let(:user) {FactoryGirl.create :user}

  before (:each) do
    sign_in(user)
  end

  context "#create" do
    it "redirects to the users show page" do
      receiver = FactoryGirl.create(:user)
      algorithm = FactoryGirl.create(:algorithm)
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id, algorithm_id: algorithm.id)
      post :create, params
      expect(response).to redirect_to(user_path(user))
    end
  end

end
