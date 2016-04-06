require "rails_helper"

describe ApplicationController do
let(:user){FactoryGirl.create(:user)}

  before (:each) do
    sign_in(user)
  end

  it "should check to see if the proper user is viewing a specific show page" do
    test = controller.send(:current_user_profile?, user)
    expect(test).to eq true
  end

  it "should check to see if the current user is the owner of a sent message" do
    message = FactoryGirl.create(:message)
    user_2 = User.create(username: "jonny", email: "jonny2@gmail.com", password: "password", password_confirmation: "password")
    algorithm = FactoryGirl.create(:algorithm)
    secret = Secret.create(sender_id: user.id, receiver_id: user_2.id, message_id: message.id, algorithm_id: algorithm.id)
    test = controller.send(:owner?, message)
    expect(test).to eq true
  end

end
