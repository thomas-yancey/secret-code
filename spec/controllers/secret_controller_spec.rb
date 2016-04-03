require 'rails_helper'

describe SecretsController do
let(:user) {FactoryGirl.create :user}

  before (:each) do
    sign_in
    # @secret = stub_model(Secret, id: 4, sender_id: user.id, receiver_id: 3, message_id: 5, algorithm_id: 4, solved: false )
  end

  context "#create" do
    it "redirects to the users show page" do
      secret = Secret.create(receiver_id: 3, message_id: 5, solved: false)
      # get :show, id: user.id
      expect(response).to redirect_to(root_path)
    end

    it "changes secret count by 1" do
      expect{
        post :create, secret: { sender_id: user.id, receiver_id: 3, message_id: 5, algorithm_id: 4, solved: false }}.to change(Secret,:count).by(1)
    end
  end

end
