module Linkedlist
  class DoublyNode(T)
    @data : T
    @prev : DoublyNode(T) | Nil
    @next : DoublyNode(T) | Nil

    property data
    property prev
    property "next"

    # Initializes a node with data and next pointer
    def initialize(@data : T, @prev : DoublyNode(T) | Nil, @next : DoublyNode(T) | Nil)
    end
  end

  class Doubly(T)
    @length : Int32
    @head : DoublyNode(T) | Nil
    @tail : DoublyNode(T) | Nil

    # Returns the length of linked list
    getter length
    # Returns the head of linked list
    getter head
    # Returns the tail of linked list
    getter tail

    # Intializes a doubly linked list
    def initialize
      @length = 0
      @head = nil
      @tail = nil
    end

    # Inserts new element at the head of the linked list
    def insert_head(data : T)
      new_node = DoublyNode(T).new(data, nil, nil)

      head = @head

      if head
        new_node.next = head
        head && head.prev = new_node
        @head = new_node
      else
        @head = new_node
        @tail = new_node
      end

      @length += 1
    end

    # Inserts new element at the tail of the linked list
    def insert_tail(data : T)
      new_node = DoublyNode(T).new(data, nil, nil)

      head = @head
      tail = @tail

      if head && tail
        curr = @tail
        curr && curr.next = new_node
        new_node.prev = curr
        @tail = new_node
      else
        @head = new_node
        @tail = new_node
      end

      @length += 1
    end

  end
end
