require 'rails_helper'

describe SecretsController do
  before (:each) do
    sign_in
    @secret = FactoryGirl.create(:secret)
  end

  context "#create" do
    it "should assign valid params" do
      expect(@secret.sender_id).to eq(2)
    end

  end

end
