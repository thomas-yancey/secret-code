require "rails_helper"

describe MessagesController do
let(:user){FactoryGirl.create :user}
  
  before(:each) do
    sign_in user
  end

  after(:each) do
    sign_out user
  end

  context "#new" do
    it "should be able to get a new message form" do
      get :new
      expect(response).to be_success
    end
  end  

  context "#create" do
    it "should save a valid new message" do
      template = FactoryGirl.create(:template)
      params = FactoryGirl.attributes_for(:message).merge(template_id: template.id)
      post :create, message: params
      expect(response).to redirect_to(users_path)
    end
  end  

end