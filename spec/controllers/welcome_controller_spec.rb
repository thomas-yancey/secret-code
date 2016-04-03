require 'rails_helper'

describe WelcomeController do
  it "should redirect to the home page" do
    get :index
    expect(response).to be_successful
  end
end
