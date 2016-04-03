require 'rails_helper'

describe Friendship do
  context "validations" do
    it {should validate_presence_of :user}
    it {should validate_presence_of :friend}

  end
end
