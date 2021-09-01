# Simple Linked List
#
# Implements a LIFO stack. Elements of the stack may contain a range of 
# data such as numbers 1-10. 
#
# Each element has a 'value' and a 'next' attribute that points to 
# the next element in the list.
#
# Instance methods of SimpleLinkedList class:
#   #push(element)
#   #size
#   #peek
#   #head
#   #tail?
#   #next
#   #datum
#   #pop
#   #reverse
#   #to_a
# 
#  SimpleLinkedList class methods:
#   ::new
#   ::from_a(data)
#
# Element instance methods:
#   #datum (getter method)
#   #next (getter method for pointer to next element)
#   #tail? (returns true if #next has a nil value)
#
# ALGORITHM
# objects of the Element class have two attributes: datum and next (the next
# Element object in the linked list)
# 
# when adding elements to an instance of SimpleLinkedList, a new Element object
# will be instantiated and if there are existing elements in the list that 
# object will use the last element as the value for its next attribute

class Element
  attr_reader :datum, :next

  def initialize(value, next_element=nil)
    @datum = value
    @next = next_element
  end

  def tail?
    @next == nil
  end
end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def push(element)
    e = Element.new(element, list[-1])
    list << e
  end

  def pop
    list.pop.datum
  end

  def head
    list[-1]
  end

  def peek
    list[-1].instance_of?(Element) ?  list[-1].datum : nil 
  end

  def size
    list.length
  end

  def empty?
    size == 0
  end

  def self.from_a(array)
    arr = array.dup
    list = SimpleLinkedList.new
    return list if arr == nil
    while arr.size > 0
      list.push(arr.pop)
    end
    list
  end

  def to_a
    as_array = list.map { |element| element.datum }.reverse
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse) 
  end
end
