# frozen_string_literal: true
require_relative 'node.rb'
require 'pry'

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def find_min(node)
    current_node = node
    current_node = current_node.left until current_node.left.nil?
    current_node
  end
  
  def deref_protocol(node, deref_node)
    node.left = nil if node.left.data == deref_node.data until node.left.nil?
  end
  
  def p_node_checker(p_node)
    return p_node.right.nil? ? nil : p_node.right.data
  end

  def delete_2_children(parent_node, node)
    smallest_node = find_min(node.right)
    smallest_node.right = node.right
    smallest_node.left = node.left
    deref_protocol(node.right, smallest_node)
    parent_node.right = smallest_node
  end

  def delete_no_children(parent_node, node)
    p_node_checker(parent_node) == node.data ?
     parent_node.right = nil :
     parent_node.left = nil
  end

  def delete_left_child(parent_node, node)
    p_node_checker(parent_node) == node.data ?
    parent_node.right = node.left : 
    parent_node.left = node.left
  end

  def delete_right_child(parent_node, node)
    p_node_checker(parent_node) == node.data ? 
    parent_node.right = node.right :
    parent_node.left = node.right
  end

  def node_empty?(node)
    node.nil?
  end
  def delete(value)
    current_node = @root
    parent_node = nil
    located = false
    return nil unless find(value)
    until located
      direction = current_node <=> value
      if direction == 1 && !current_node.left.nil?
        parent_node = current_node
        current_node = current_node.left
      elsif direction == -1 && !current_node.right.nil?
        parent_node = current_node
        current_node = current_node.right
      elsif direction.zero?
        right_node = node_empty?(current_node.right)
        left_node = node_empty?(current_node.left)
        delete_no_children(parent_node, current_node) if left_node && right_node
        delete_right_child(parent_node, current_node) if left_node && !right_node
        delete_left_child(parent_node, current_node) if !left_node && right_node
        delete_2_children(parent_node, current_node) if !left_node && !right_node
        located = true
        end
      end
    end


  def find(value)
    root_node = @root
    current_node = root_node
    located = false
    until located
      direction = current_node <=> value
      if direction == 1 && !current_node.left.nil?
        parent_node = current_node
        current_node = current_node.left
      elsif direction == -1 && !current_node.right.nil?
        parent_node = current_node
        current_node = current_node.right
      elsif direction.zero?
        puts "Node found! Value = (#{value})"
        return true
      else
       puts 'unable to locate that node'
       return false
      end
    end
  end

  def insert(value)
    root_node = @root
    current_node = root_node
    located = false
    node_to_be_located = Node.new(value)
    until located
      direction = current_node <=> node_to_be_located
      if direction == 1
        if current_node.left.nil?
          current_node.left = node_to_be_located
          located = true
          current_node = root_node
        else
          current_node = current_node.left
        end
      elsif direction == -1
        if current_node.right.nil?
           current_node.right = node_to_be_located
           located = true
           current_node = root_node
        else
          current_node = current_node.right
        end
      end
      end
  end

  def build_tree(arr)
    root_node = Node.new(arr.shift)
    current_node = root_node
    arr.each do |value|
      located = false
      node_to_be_located = Node.new(value)
      until located
        direction = current_node <=> node_to_be_located
        if direction == 1
          if current_node.left.nil?
            current_node.left = node_to_be_located
            located = true
            current_node = root_node
          else
            current_node = current_node.left
          end
        elsif direction == -1
          if current_node.right.nil?
            current_node.right = node_to_be_located
            located = true
            current_node = root_node
          else
            current_node = current_node.right
          end
        end
      end
    end
    root_node
  end
end

to_balance = [5, 19, 1, 23, 11, 6, 2, 10, 57]

x = Tree.new(to_balance)

x.root
x.insert(20)
x.delete(19)
p x.root
x.find(20)
x.find(19)
x.delete(10)
p x.root
x.find(10)

