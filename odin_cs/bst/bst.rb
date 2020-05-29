require_relative 'node.rb'
require 'pry'

class Tree

    attr_reader :root
    def initialize(arr)
        @root = build_tree(arr)
    end

    #todo 

    def find_min(node)
        current_node = node
        while !current_node.left.nil?
            current_node = current_node.left
        end
         current_node
    end

    def deref_protocol(node, deref_node)
        current_node = node
        while !current_node.left.nil?
            if current_node.left.data == deref_node.data
                current_node.left = nil
            end
        end
 
    end

    def delete(value)
        root_node = @root
        current_node = root_node
        parent_node = nil
        child_node = nil
        located = false
        node_to_be_deleted = Node.new(value)

        while !located
            direction = current_node<=>node_to_be_deleted
            if direction == 1 && !current_node.left.nil?
                    parent_node = current_node
                    current_node = current_node.left
                   
            elsif direction == -1 && !current_node.right.nil?
                    parent_node = current_node
                    current_node = current_node.right
                #node to be deleted /cry
            elsif direction == 0
                left_child = current_node.left.nil?
                right_child = current_node.right.nil?
                p_node_checker = nil
                parent_node.right.nil? ? nil : p_node_checker = parent_node.right.data
                if left_child && right_child
                    p_node_checker == current_node.data ? parent_node.right = nil : parent_node.left = nil

                elsif left_child && !right_child
                    p_node_checker == current_node.data ? parent_node.right = current_node.right : 
                                                          parent_node.left = current_node.right
                elsif !left_child && right_child
                    p_node_checker == current_node.data ? parent_node.right = current_node.left : 
                                                        parent_node.left = current_node.left
                elsif !left_child && !right_child
                    
                    smallest_node = find_min(current_node.right)
                    
                    smallest_node.right = current_node.right
                  
                    smallest_node.left = current_node.left
                   
                    deref_protocol(current_node.right, smallest_node)
                    parent_node.right = smallest_node
                   


                end
                
                located = true
            end
        end
    end


    def insert(value)
        root_node = @root
        current_node = root_node
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
p x.root
puts "++++++++++++++"
p x.insert(20)

# puts "++++++++++++++"
 x.delete(19)
# puts "++++++++++++++"
 p x.root
