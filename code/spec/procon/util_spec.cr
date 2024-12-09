require "spec"
require "procon/util"

module UtilSpec
  describe "#min_u" do
    it { a = 2; min_u(a, 1); a.should eq 1 }
    it { a = 2; min_u(a, 3); a.should eq 2 }
    it { a = 2; min_u(a, 3, 5); a.should eq 2 }
    it { a = 2; min_u(a, 1, 3); a.should eq 1 }
    it { a = 2; min_u(a, 0, 1); a.should eq 0 }
  end

  describe "#max_u" do
    it { a = 2; max_u(a, 1); a.should eq 2 }
    it { a = 2; max_u(a, 3); a.should eq 3 }
    it { a = 2; max_u(a, 0, 1); a.should eq 2 }
    it { a = 2; max_u(a, 1, 3); a.should eq 3 }
    it { a = 2; max_u(a, 3, 5); a.should eq 5 }
  end
end
