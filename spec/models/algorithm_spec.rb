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

  context "methods" do
    let(:algorithm){Algorithm.create(question: "Create a method that takes two numbers and adds them together",
                   method_outline: "def add(a,b)\n # your code here\nend",
                   casetests: "1,1 2,2 4,3 5,5",
                   caseanswers: "2 4 7 10")}

    context "converting_symbols_to_operators" do
      it "should convert the ™ symbol on the back end" do
        expect(Algorithm.convert_operators("™")).to eq("+")
      end

      it "should convert the ¡ symbol on the back end" do
        expect(Algorithm.convert_operators("¡")).to eq("-")
      end

      it "should convert the £ symbol on the back end" do
        expect(Algorithm.convert_operators("£")).to eq("=")
      end

      it "should convert the • symbol on the back end" do
        expect(Algorithm.convert_operators("•")).to eq("*")
      end

    end

    context "casetests_to_array" do
      it "should split casetests into appropriate nested arrays" do
        casetests = algorithm.casetests_to_array
        expect(casetests).to eq([[1, 1], [2, 2], [4, 3], [5, 5]])
      end
    end

    context "caseanswers_to_array" do
      it "should split caseanswers into an array" do
        caseanswers = algorithm.caseanswers_to_array
        expect(caseanswers).to eq([2, 4, 7, 10])
      end
    end
  end

end
