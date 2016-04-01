require 'rails_helper'

describe Message do

  context "associations" do
    it { should have_many :secrets }
    it { should belong_to :template }
    it { should have_many :users }
  end

  context "validations" do
    it {should validate_presence_of :template}
    it {should validate_presence_of :content}
    it {should validate_presence_of :secret_key}
  end

end