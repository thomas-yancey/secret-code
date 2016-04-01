require 'rails_helper'

describe Secret do

  context "validations" do
    it { should belong_to :sender }
    it { should belong_to :receiver }
    it { should belong_to :message }
  end

end