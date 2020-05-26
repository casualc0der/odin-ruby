class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  #add node to end of the list
  def append(value)
    node = Node.new(value)

    #if there is no head node, we can assume that the list is empty. Hence we set the head/tail to point to the same node
    if @head.nil?
      set_head_and_tail(node)
    else
      tmp = @head
      tmp = tmp.next_node while tmp.next_node != nil
      tmp.next_node = node
      @tail = node
    end
  end

  def set_head_and_tail(node)
    @head = node
    @tail = node
  end

  #add node to the start of the list
  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      set_head_and_tail(node)
    else
      tmp = @head
      @head = node
      @head.next_node = tmp
    end
  end

  def size
    return 0 if @head.nil?
    counter = 1
    tmp = @head
    while tmp.next_node != nil
      tmp = tmp.next_node
      counter += 1
    end
    counter
  end

  def at(index)
    return nil if @head.nil?
    counter = 0
    tmp = @head
    while counter != index
      tmp = tmp.next_node
      counter += 1
    end
    tmp
  end

  def pop
    return nil if @head.nil?
    tmp = @head
    tmp = tmp.next_node while tmp.next_node != @tail
    tmp.next_node = nil
    @tail = tmp
  end

  def contains?(value)
    return nil if @head.nil?
    tmp = @head
    while tmp.next_node != nil
      return true if tmp.value == value
      tmp = tmp.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?
    index = 0
    tmp = @head
    while tmp != nil
      return index if tmp.value == value
      tmp = tmp.next_node
      index += 1
    end
  end

  def to_s
    return nil if @head.nil?
    list_schema = ''
    tmp = @head
    while tmp != nil
      list_schema << "(#{tmp.value}) -> "
      list_schema << 'nil' if tmp.next_node == nil
      tmp = tmp.next_node
    end
    list_schema
  end

  def insert_at(value, index)
    return nil if @head.nil?
    node = Node.new(value)
    counter = 0
    tmp = @head
    if index == 0
      node.next_node = tmp
      @head = node
      return
    end
    until counter == index - 1
      tmp = tmp.next_node
      counter += 1
    end
    node.next_node = tmp.next_node
    tmp.next_node = node
  end

  def remove_at(index)
    tmp = @head
    tmp2 = @head
    counter = 0

    if index == 0
      @head = @head.next_node
      return
    end

    until counter == index - 1
      tmp = tmp.next_node
      counter += 1
    end
    counter = 0

    until counter == index + 1
      tmp2 = tmp2.next_node
      counter += 1
    end

    tmp.next_node = tmp2
  end
end

list = LinkedList.new

list.append(1) #=> Add 1 to end of list
list.append(2) #=> Add 2 to end of list
list.append(3) #=> Add 3 to end of list
list.prepend(4) #=> Add 4 to start of list
list.append(5) #=> Add 5 to end of list

p list.pop #=> remove 5 from the list

p list.contains?(5) #=> false
p list.contains?(1) #=> true

p list.find(4) #=> 0
p list.find(5) #=> nil
p list.find(3) #=> 3

p list.to_s #=> "(4) -> (1) -> (2) -> (3) -> nil"
list.insert_at(6, 0)
p list.to_s #=> "(6) -> (4) -> (1) -> (2) -> (3) -> nil"
list.insert_at(7, 1)
p list.to_s #=> "(6) -> (7) -> (4) -> (1) -> (2) -> (3) -> nil"

list.remove_at(0)
p list.to_s #=> "(7) -> (4) -> (1) -> (2) -> (3) -> nil"
list.remove_at(1)
p list.to_s #=> "(7) -> (1) -> (2) -> (3) -> nil"
