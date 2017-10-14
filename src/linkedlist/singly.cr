module Linkedlist
  class SinglyNode(T)
    @data : T
    @next : SinglyNode(T) | Nil

    property data
    property "next"

    # Initializes a node with data and next pointer
    def initialize(@data : T, @next : SinglyNode(T) | Nil)
    end
  end

  class Singly(T)
    @length : Int32
    @head : SinglyNode(T) | Nil
    @tail : SinglyNode(T) | Nil

    # Returns the length of linked list.
    #
    # Running time: O(1)
    getter length
    # Returns the head of linked list
    #
    # Running time: O(1)
    getter head
    # Returns the tail of linked list
    #
    # Running time: O(1)
    getter tail

    # Intializes a singly linked list
    def initialize
      @length = 0
      @head = nil
      @tail = nil
    end

    # Inserts new element at the head of the linked list
    #
    # Running time: O(1)
    def insert_head(data : T)
      new_node = SinglyNode.new(data, nil)

      if @head == nil
        @head = new_node
        @tail = new_node
      else
        new_node.next = @head
        @head = new_node
      end

      @length += 1
    end

    # Inserts new element at the tail of the linked list
    #
    # Running time: O(1)
    def insert_tail(data : T)
      new_node = SinglyNode.new(data, nil)

      if @head == nil
        @head = new_node
        @tail = new_node
      else
        tail = @tail
        if tail
          tail.next = new_node
          @tail = new_node
        end
      end

      @length += 1
    end

    # Removes an element from the linked list
    #
    # Running time: O(n)
    def remove(element : SinglyNode(T)) : T
      prev = nil
      curr = @head

      while curr && curr != element
        prev = curr
        curr = curr.next
      end
      if curr
        if prev
          # element present at position other than head
          prev.next = curr.next
        else
          # element present at head
          @head = curr.next
        end
        if curr.next == nil
          @tail = prev
        end
        return element.data
      else
        raise "ElementNotFound"
      end
    end

    # Returns the first element with value or raises exception if not found
    #
    # Running time: O(n)
    def find_element(value : T) : SinglyNode(T)
      curr = @head
      while curr && curr.data != value
        curr = curr.next
      end

      if !curr
        raise "ElementNotFound"
      end

      return curr
    end

    # Returns the first element with value or nil if not found
    #
    # Running time: O(n)
    def find_element?(value : T) : SinglyNode(T) | Nil
      curr = @head
      while curr && curr.data != value
        curr = curr.next
      end
      curr
    end
  end
end
