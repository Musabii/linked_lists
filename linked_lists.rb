# frozen_string_literal: true

# linked lists class
class LinkedList
  def initialize
    @head = Node.new
  end

  def append(value)
    tail.next_node = Node.new(value)
  end

  def prepend(value)
    temp = Node.new(value)
    temp.next_node = @head.next_node
    @head.next_node = temp
  end

  def size
    current_node = @head.next_node
    nodes = 0
    return nodes if current_node.nil?

    loop do
      nodes += 1
      current_node = current_node.next_node
      break if current_node.nil?
    end
    nodes
  end

  def head
    @head.next_node
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    i = 0
    current_node = @head
    loop do
      current_node = current_node.next_node
      break if i == index

      i += 1
    end
    current_node
  end

  def pop
    current_node = @head
    loop do
      current_node = current_node.next_node
      break if current_node.next_node == tail
    end
    current_node.next_node = nil
  end

  def contains?(value)
    current_node = @head
    loop do
      current_node = current_node.next_node
      return true if current_node.value == value
      return false if current_node.next_node.nil?
    end
  end

  def find(value)
    current_node = @head
    i = 0
    loop do
      current_node = current_node.next_node
      return i if current_node.value == value
      return nil if current_node.next_node.nil?

      i += 1
    end
  end

  def to_s
    current_node = @head
    str = ''
    loop do
      current_node = current_node.next_node
      str += "( #{current_node.value} ) -> "
      break if current_node.next_node.nil?
    end
    str += '( nil )'
  end
end

# nodes class
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil)
    @value = value
  end
end

list = LinkedList.new
list.append('YourMom')
list.append('Yourmomsmom')
puts list.at(1)
puts list.size
puts list.size
puts list.contains?('YourMoms')
puts list.find('Yourmomsmom')
puts list.to_s