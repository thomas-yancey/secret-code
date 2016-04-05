require 'rails_helper'

describe Friendship do
  let(:user){FactoryGirl.create(:user)}
  
  context "validations" do
    it {should validate_presence_of :user}
    it {should validate_presence_of :friend}
  end

  context "methods" do
    context "#current_friend_ids" do
      it "returns a list of current friends" do
        expect(Friendship.current_friend_ids(user)).to be_an_instance_of(Array)
      end
    end

    it "returns a list of pending friend requests" do
       expect(Friendship.current_friend_request_ids(user)).to be_an_instance_of(Array)
    end
  end
end
