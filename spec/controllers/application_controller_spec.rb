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

end