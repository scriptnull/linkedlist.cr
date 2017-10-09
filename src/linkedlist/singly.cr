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

    getter length
    getter head

    # Intializes a singly linked list
    def initialize
      @length = 0
      @head = nil
    end

    # Inserts new element at the head of the linked list
    def insert_head(data : T)
      new_node = SinglyNode.new(data, nil)

      if @head == nil
        @head = new_node
      else
        new_node.next = @head
        @head = new_node
      end

      @length += 1
    end

    # Inserts new element at the tail of the linked list
    def insert_tail(data : T)
      new_node = SinglyNode.new(data, nil)

      if @head == nil
        @head = new_node
      else
        curr = @head
        while curr && curr.next != nil
          curr = curr.next
        end
        curr && curr.next = new_node
      end

      @length += 1
    end

  end
end
