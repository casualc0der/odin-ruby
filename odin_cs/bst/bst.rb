require_relative 'node.rb'
require 'pry'

class Tree

    attr_reader :root
    def initialize(arr)
        @root = build_tree(arr)
    end

    def print
        @root
    end

    def build_tree(arr)
        root_node = Node.new(arr.shift)
        current_node = root_node

        arr.each do |value|
            located = false
            node_to_be_located = Node.new(value)
            while !located
                direction = current_node<=>node_to_be_located
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

to_balance = [5,19,1,23,11,6,2,10,57]

x = Tree.new(to_balance)
p x.print