require "rails_helper"

describe MessagesController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @algorithm = FactoryGirl.create(:algorithm)
    @message = FactoryGirl.create(:message)
    @template = FactoryGirl.create(:template)
    @secret = Secret.create(sender_id: @user.id, receiver_id: @user.id, algorithm_id: @algorithm.id, message_id: @message.id)
  end

  after(:each) do
    sign_out @user
  end

  context "#new" do
    it "should be able to get a new message form" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    it "should save a valid new message" do
      params = FactoryGirl.attributes_for(:message).merge(template_id: @template.id)
      post :create, message: params
      expect(response).to redirect_to(users_path)
    end

    it "should redirect back if the message is invalid" do
      request.env["HTTP_REFERER"] = messages_path
      params = FactoryGirl.attributes_for(:message).merge(content: "")
      post :create, message: params
      expect(response).to redirect_to(request.env["HTTP_REFERER"])
    end
  end

  context "#show" do
    it "will redirect to the message if the secret is solved" do
      @secret.solved = true
      @secret.save!
      @message.secrets << @secret
      get :show, id: @message.id
      expect(response).to render_template("messages/show")
    end

    it "will redirect to the root page if a user is not the receiver" do
      @message.secrets.first.delete
      @new_secret = FactoryGirl.create(:secret)
      @message.secrets << @new_secret
      get :show, id: @message.id
      expect(response).to redirect_to(root_path)
    end
  end

end
