require "spec"
require "procon/data_structure/linked_list"

module LinkedListSpec
  describe LinkedList do
    describe "#add" do
      l = LinkedList(Int32).new
      n = l.first_guard.add(5)
      m = l.first_guard.add(2)
      it { n.value.should eq 5 }
      it { n.prev.first_guard?.should be_false }
      it { n.succ.last_guard?.should be_true }
      it { m.value.should eq 2 }
      it { m.prev.first_guard?.should be_true }
      it { m.succ.last_guard?.should be_false }
      it { l.to_a.should eq [2, 5] }
    end

    describe "#remove" do
      l = LinkedList(Int32).new
      n = l.first_guard.add(5)
      m = l.first_guard.add(2)
      m.remove
      it { n.value.should eq 5 }
      it { n.prev.first_guard?.should be_true }
      it { n.succ.last_guard?.should be_true }
      it { l.to_a.should eq [5] }
    end
  end
end
