require 'rails_helper'

describe User do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
  end

  context "associations" do
    it { should have_many :received_messages }
    it { should have_many :sent_messages }
    it { should have_many :messages }
    it { should have_many :secrets }
    it { should have_many :friendships }
    it { should have_many :passive_friendships }
    it { should have_many :active_friends }
    it { should have_many :passive_friends }
    it { should have_many :pending_friends }
    it { should have_many :requested_friendships }
    it { should have_many :active_friends }
    it { should have_many :passive_friends }
  end

  context "methods" do
    context "friends" do
      it "should return the list of friends and pending friend requests" do
        user = User.create(username: "jon", email: "jon@gmail.com", password: "password", password_confirmation: "password")
        expect(user).to respond_to(:friends)
      end
    end
  end

end
