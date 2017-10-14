require "./spec_helper.cr"

describe "Doubly" do
  describe "#new" do
    ll = Linkedlist::Doubly(Int32).new

    it "should have zero length" do
      ll.length.should eq(0)
    end

    it "should have head as nil" do
      ll.head.should be_nil
    end

    it "should have tail as nil" do
      ll.tail.should be_nil
    end
  end

  describe "#insert_head" do
    ll = Linkedlist::Doubly(Int32).new

    context "when inserting in empty linked list" do
      ll.insert_head(1)

      it "should have length 1" do
        ll.length.should eq(1)
      end

      it "should have head with data as 1" do
        head = ll.head
        head.should_not be_nil
        if head
          head.data.should eq(1)
        end
      end

      it "should have tail with data as 1" do
        tail = ll.tail
        tail.should_not be_nil
        if tail
          tail.data.should eq(1)
        end
      end
    end

    context "when inserting in non-empty linked list " do
      ll.insert_head(2)

      it "should have length 2" do
        ll.length.should eq(2)
      end

      it "should have head with data as 2" do
        head = ll.head
        head.should_not be_nil
        if head
          head.data.should eq(2)
        end
      end

      it "should have tail with data as 1" do
        tail = ll.tail
        tail.should_not be_nil
        if tail
          tail.data.should eq(1)
        end
      end
    end

    context "when traversing" do
      it "should traverse forward with correct values" do
        curr = ll.head
        expected = [2, 1]
        testIndex = 0
        while curr
          curr.data.should eq(expected[testIndex])
          testIndex += 1
          curr = curr.next
        end
      end

      it "should traverse backward with correct values" do
        curr = ll.head
        while curr && curr.next
          curr = curr.next
        end

        expected = [1, 2]
        testIndex = 0
        while curr
          curr.data.should eq(expected[testIndex])
          curr = curr.prev
          testIndex += 1
        end
      end
    end
  end

  describe "#insert_tail" do
    ll = Linkedlist::Doubly(Int32).new

    context "when inserting in empty linked list" do
      ll.insert_tail(1)

      it "should have length 1" do
        ll.length.should eq(1)
      end

      it "should have head with data as 1" do
        head = ll.head
        head.should_not be_nil
        if head
          head.data.should eq(1)
        end
      end

      it "should have tail with data as 1" do
        tail = ll.tail
        tail.should_not be_nil
        if tail
          tail.data.should eq(1)
        end
      end
    end

    context "when inserting in non-empty linked list" do
      ll.insert_tail(2)

      it "should have length 1" do
        ll.length.should eq(2)
      end

      it "should have head with data as 1" do
        head = ll.head
        head.should_not be_nil
        if head
          head.data.should eq(1)
        end
      end

      it "should have tail with data as 2" do
        tail = ll.tail
        tail.should_not be_nil
        if tail
          tail.data.should eq(2)
        end
      end
    end

    context "when traversing" do
      it "should traverse forward with correct values" do
        curr = ll.head
        expected = [1, 2]
        testIndex = 0
        while curr
          curr.data.should eq(expected[testIndex])
          testIndex += 1
          curr = curr.next
        end
      end

      it "should traverse backward with correct values" do
        curr = ll.head
        while curr && curr.next
          curr = curr.next
        end

        expected = [2, 1]
        testIndex = 0
        while curr
          curr.data.should eq(expected[testIndex])
          curr = curr.prev
          testIndex += 1
        end
      end
    end
  end
end
