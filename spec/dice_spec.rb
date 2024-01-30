require 'dice'

RSpec.describe Dice do
  describe "#roll" do
    let(:roll_value) { Dice.roll }

    it "returns a valid face" do
      expect(Dice::FACES).to include(roll_value)
    end
  end
end