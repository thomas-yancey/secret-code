require 'rails_helper'

describe Template do

  context "validations" do
    it { should validate_presence_of :content }
    it { should have_many :messages }
  end

end