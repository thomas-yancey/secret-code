require 'rails_helper'

describe Algorithm do

  context "associations" do
    it {should have_many :secrets}
  end

  context "validations" do
    it {should validate_presence_of :question}
    it {should validate_presence_of :method_outline}
    it {should validate_presence_of :casetests}
    it {should validate_presence_of :caseanswers}
  end

end