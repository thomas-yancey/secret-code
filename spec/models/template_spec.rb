require 'rails_helper'

describe Template do

  context "validations" do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should validate_presence_of :preview_url }
  end

end
