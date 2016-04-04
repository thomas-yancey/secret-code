require 'rails_helper'

describe Template do

  context "associations" do
    it { should have_many :messages }
  end

  context "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should validate_presence_of :preview_url }
  end

end
