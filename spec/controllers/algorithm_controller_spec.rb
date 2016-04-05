require 'rails_helper'

describe AlgorithmsController do
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @receiver = FactoryGirl.create(:user)
    @algorithm = FactoryGirl.create(:algorithm)
    @message = FactoryGirl.create(:message)
    @secret = FactoryGirl.create(:secret)
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