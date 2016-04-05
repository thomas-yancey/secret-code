require 'rails_helper'

describe SecretsController do
  let(:user){FactoryGirl.create :user}
  let(:receiver){FactoryGirl.create :user}
  let(:algorithm){FactoryGirl.create :algorithm}
  let(:message){FactoryGirl.create :message}
  let(:secret){FactoryGirl.create :secret}

  before (:each) do
    sign_in user
  end

  after(:each) do
    sign_out user
  end

  context "#create" do
    it "redirects to the users show page" do
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id, algorithm_id: algorithm.id, sender_id: user.id, message_id: message.id)
      post :create, params
      expect(response).to redirect_to(user_path(user))
  end

    it "redirects to the secrets page if you mess up" do
      request.env["HTTP_REFERER"] = secrets_path
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id)
      post :create, params
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end

  end

  context "#show" do
    it "redirects to the secret message if solved" do
      params = FactoryGirl.attributes_for(:secret).merge(receiver_id: receiver.id, algorithm_id: algorithm.id, sender_id: user.id, message_id: message.id)
      get :show, id: params[:sender_id]
      expect(response).to redirect_to(message_path)
    end

    it "redirects to the algorithm if the secret message is not solved" do
      params = FactoryGirl.attributes_for(:algorithm).merge(secret_id: secret.id)
      get :show, id: params[:secret_id]
      expect(response).to redirect_to("/algorithms/#{secret.algorithm.id}?secret_id=#{secret.id}")
    end
  end

end
