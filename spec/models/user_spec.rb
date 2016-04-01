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
  end

end