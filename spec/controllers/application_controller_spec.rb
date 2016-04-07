require "rails_helper"

describe ApplicationController do
let(:user){FactoryGirl.create(:user)}

  before (:each) do
    sign_in(user)
  end

end
