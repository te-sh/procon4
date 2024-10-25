require "spec"
require "procon/bit"

module IntSpec
  describe Int do
    describe "#bit?" do
      it { 5.bit?(1).should be_false }
      it { 5.bit?(2).should be_true }
    end

    describe "#set_bit" do
      it { 5.set_bit(1).should eq 7 }
      it { 5.set_bit(2).should eq 5 }
    end

    describe "#reset_bit" do
      it { 5.reset_bit(1).should eq 5 }
      it { 5.reset_bit(2).should eq 1 }
    end

    describe "#bit_subsets" do
      it do
        0b10101.bit_subsets.to_a.should eq [
          0b10101, 0b10100, 0b10001, 0b10000,
          0b00101, 0b00100, 0b00001, 0b00000
        ]
      end
    end

    describe "#bit_supersets" do
      it do
        0b0110.bit_supersets(4).to_a.should eq [
          0b0110, 0b0111, 0b1110, 0b1111
        ]
      end
    end
  end
end
