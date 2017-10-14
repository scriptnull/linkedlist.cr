require "./spec_helper.cr"

describe "Singly" do
  describe "#new" do
    ll = Linkedlist::Singly(Int32).new

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
    ll = Linkedlist::Singly(Int32).new

    context "when inserting in empty linked list" do
      ll.insert_head(1)

      it "should have length 1" do
        ll.length.should eq(1)
      end

      it "should have non-nil head" do
        ll.head.should_not be_nil
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
    end
  end

  describe "#insert_tail" do
    ll = Linkedlist::Singly(Int32).new

    context "when inserting in empty linked list" do
      ll.insert_tail(1)

      it "should have length 1" do
        ll.length.should eq(1)
      end

      it "should have tail with data as 1" do
        tail = ll.tail
        tail.should_not be_nil
        if tail
          tail.data.should eq(1)
        end
      end

      it "should have head with data as 1" do
        head = ll.head
        head.should_not be_nil
        if head
          head.data.should eq(1)
        end
      end
    end

    context "when inserting in non-empty linked list" do
      ll.insert_tail(2)

      it "should have length 1" do
        ll.length.should eq(2)
      end

      it "should have non-nil head" do
        ll.head.should_not be_nil
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
    end
  end

  describe "#remove" do
    ll = Linkedlist::Singly(Int32).new

    context "when removing at head till empty" do
      10.times do |i|
        ll.insert_head(i + 1)
      end

      it "should remove head" do
        head = ll.head
        while head
          ll.remove(head).should eq(head.data)
          head = ll.head
        end

        ll.head.should be_nil
        ll.tail.should be_nil
      end
    end

    context "when removing at tail till empty" do
      10.times do |i|
        ll.insert_head(i + 1)
      end

      it "should remove head" do
        tail = ll.tail
        while tail
          ll.remove(tail).should eq(tail.data)
          tail = ll.tail
        end

        ll.tail.should be_nil
        ll.head.should be_nil
      end
    end
  end

  describe "#find_element" do
    ll = Linkedlist::Singly(Int32).new

    context "when trying to find in empty list" do
      it "should raise exception" do
        expect_raises { ll.find_element(2) }
      end
    end

    context "when trying to find non-empty list" do
      10.times do |i|
        ll.insert_tail(i + 1)
      end

      it "should raise exception if not found" do
        expect_raises { ll.find_element(20) }
      end

      it "should return element if found" do
        found = ll.find_element(8)
        found.should_not be_nil

        if found
          nextElement = found.next
          nextElement.should_not be_nil

          if nextElement
            nextElement.data.should eq(9)
          end
        end
      end
    end

    describe "#find_element?" do
      ll = Linkedlist::Singly(Int32).new

      context "when trying to find in empty list" do
        it "should return nil" do
          ll.find_element?(2).should be_nil
        end
      end

      context "when trying to find non-empty list" do
        10.times do |i|
          ll.insert_tail(i + 1)
        end

        it "should return nil if not found" do
          ll.find_element?(20).should be_nil
        end

        it "should return element if found" do
          found = ll.find_element?(8)
          found.should_not be_nil

          if found
            nextElement = found.next
            nextElement.should_not be_nil

            if nextElement
              nextElement.data.should eq(9)
            end
          end
        end
      end
    end
  end
end
