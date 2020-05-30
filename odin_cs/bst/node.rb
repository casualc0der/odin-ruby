class Node 
    attr_accessor :left, :right, :data
include Comparable
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
    end
    def <=>(node)
        value = nil
        node.class == Node ? value = node.data : value = node

        @data <=> value
    end
end

