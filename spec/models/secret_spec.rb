require 'rails_helper'

describe Secret do

  context "associations" do
    it { should belong_to :sender }
    it { should belong_to :receiver }
    it { should belong_to :message }
  end

  context "validations" do
    it { should validate_presence_of :message }
    it { should validate_presence_of :sender }
    it { should validate_presence_of :receiver }
    it { should validate_presence_of :algorithm }

  end

end
