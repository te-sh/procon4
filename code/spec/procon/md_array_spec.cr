require "spec"
require "procon/md_array"

module MdArraySpec
  describe ".new" do
    context "without block" do
      a = MdArray.new(2, 3, 4)
      it { a.size.should eq 2 }
      it { a[0].should eq [4, 4, 4] }
      it { a[1].should eq [4, 4, 4] }
    end

    context "with block" do
      a = MdArray.new(2, 3) { |i, j| i + j }
      it { a.size.should eq 2 }
      it { a[0].should eq [0, 1, 2] }
      it { a[1].should eq [1, 2, 3] }
    end
  end
end
