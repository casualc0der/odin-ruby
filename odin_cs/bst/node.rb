class Node 
    attr_accessor :left, :right, :data
include Comparable
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
    end
    def <=>(other)
        @data <=> other.data
    end
end

