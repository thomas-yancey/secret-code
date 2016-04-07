require 'rails_helper'

describe AlgorithmsController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @receiver = User.create(email: "Jonny2@gmail.com", username: "jonny", password: "password", password_confirmation: "password")
    @algorithm = FactoryGirl.create(:algorithm)
    @message = FactoryGirl.create(:message)
    @secret = Secret.create(id: 2, receiver_id: @receiver.id, algorithm_id: @algorithm.id, sender_id: @user.id, message_id: @message.id)
  end

  after(:each) do
    sign_out @user
  end

  context "#show" do
    it "should show the algorithm for the user to solve" do
      get :show, id: @algorithm.id
      expect(response).to render_template("algorithms/show")
    end
  end

  context "#run_code" do
    it "should display the user's message link upon completion" do
      get :run_code, data: URI.escape("def add(a,b)\n a+b \nend"), algorithm_id:@algorithm.id, secret_id: @secret.id
      expect(response).to render_template("algorithms/_run_code")
    end

    it "should display incorrect answers upon completion" do
      get :run_code, data: URI.escape("def add(a,b)\n a-b \nend"), algorithm_id:@algorithm.id, secret_id: @secret.id
      expect(response).to render_template("algorithms/_run_code")
    end
  end

end
