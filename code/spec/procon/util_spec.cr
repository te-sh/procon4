require "spec"
require "procon/util"

module UtilSpec
  describe "#min_u" do
    it { a = 2; min_u(a, 1); a.should eq 1 }
    it { a = 2; min_u(a, 3); a.should eq 2 }
  end

  describe "#max_u" do
    it { a = 2; max_u(a, 1); a.should eq 2 }
    it { a = 2; max_u(a, 3); a.should eq 3 }
  end

  describe "#cdiv" do
    it { cdiv(4, 3).should eq 2 }
    it { cdiv(6, 3).should eq 2 }
  end
end
