require 'rails_helper'

describe SecretsController do
let(:user) {FactoryGirl.create :user}

  before (:each) do
    sign_in user
  end

  after(:each) do
    sign_out user
  end

  context "#create" do
    it "redirects to the users show page" do
      receiver = FactoryGirl.create(:user)
      algorithm = FactoryGirl.create(:algorithm)
      message = FactoryGirl.create(:message)
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id, algorithm_id: algorithm.id, sender_id: user.id, message_id: message.id)
      post :create, params
      expect(response).to redirect_to(user_path(user))
  end

    it "redirects to the secrets page if you mess up" do
      request.env["HTTP_REFERER"] = secrets_path

      receiver = FactoryGirl.create(:user)
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id)
      post :create, params
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end

  end

  context "#show" do
    it "redirects to the secret message if solved" do
      secret = FactoryGirl.create(:secret)
      secret.solved = true
      secret.save!
      expect(response).to redirect_to("/messages/#{secret.message_id}")
    end
  end

end
