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

  end
end
