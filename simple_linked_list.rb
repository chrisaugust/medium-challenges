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
# #push(value)
# when adding elements to an instance of SimpleLinkedList, the current head will
# be assigned to `next_element`, and a new Element object will be instantiated 
# with `value` and `next_element` as argunments, and this Element object is 
# assigned to `head`
#
# #size
# - initialize a counter variable to 0
# - current_element is assigned to head
# - while current_element
#   - increment counter by 1
#   - reassign current_element to the Element object referenced by Element#next
# - return counter
#
# #pop
# - check if the list has an element
#   - if yes:
#     - set head to element.next
#     - return element.datum
#   - if no:
#     - return nil 
#
# #from_a
# - create a new SimpleLinkedList instance and assign to list
# - for each element in argument array (in reverse order!):
#   - push element to SimpleLinkedList
# - return list
#
# #to_a
# - initialize empty array
# - set current_element to head
# - while current_element
#   - push current_element.datum to array
#   - reassign current_element to current_element.next 
# - return array

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
  attr_reader :head

  def push(element)
    next_element = head
    @head = Element.new(element, next_element)
  end

  def pop
    return nil if empty?
    current_element = head
    @head = current_element.next
    current_element.datum
  end

  def size
    counter = 0
    current_element = @head
    while current_element 
      counter += 1
      current_element = current_element.next
    end
    counter
  end

  def empty?
    head.nil? 
  end
  
  def peek
    empty? ? nil : head.datum    
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    return list if array.nil?
    array.reverse_each do |element|
      list.push(element)
    end
    list
  end

  def to_a
    array = []
    current_element = head
    while current_element
      array << current_element.datum
      current_element = current_element.next
    end
    array
  end

  def reverse
    array = self.to_a.reverse
    reversed = SimpleLinkedList.from_a(array)
    reversed
  end
end
