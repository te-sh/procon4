require "spec"
require "procon/ext/int"

module IntSpec
  describe Int do
    describe "#cdiv" do
      it { 8.cdiv(3).should eq 3 }
      it { 9.cdiv(3).should eq 3 }
    end
  end
end
