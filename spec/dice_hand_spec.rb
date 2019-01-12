require "dice_hand"

describe Dice_Hand do
    describe ".find_value" do
        context "Given an array with a value in place 0 and 3" do
            let(:hand) {Dice_Hand.new('nick', 20)}
            it "Returns [0,3]" do
                expect(hand.find_value([2,1,1,2,1], 2)).to eql([0,3])
            end
        end
    end 
end