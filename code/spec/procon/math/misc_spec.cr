require "spec"
require "procon/math/misc"

module MiscSpec
  describe "#cdiv" do
    it { cdiv(4, 3).should eq 2 }
    it { cdiv(6, 3).should eq 2 }
  end

  describe "#ext_gcd" do
    it { ext_gcd(13, 5).should eq ({1, 2, -5}) }
    it { ext_gcd(21, 18).should eq ({3, 1, -1}) }
  end
end
