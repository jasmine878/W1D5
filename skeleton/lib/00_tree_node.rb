require 'byebug'

class PolyTreeNode
    attr_reader :children, :value, :parent
    # attr_accessor :parent

    def initialize(value = "root")
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)  #node2.parent = node1
        unless self.parent.nil?
            self.parent.children.delete(self)
        end

        if new_parent.nil?
            @parent = nil
        else
            @parent = new_parent
            unless @parent.children.include?(self)
                @parent.children << self
            end
        end
    end

    def add_child(child_node) # node2.add_child(node3)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent.nil?
            raise
        else
            child_node.parent = nil
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        # debugger

        self.children.each do |child|
            node = child.dfs(target_value) #node = nil for child= 4
            #memoize recursive call bc if it's the node we're looking for it will return the node
            return node unless node.nil?
        end
        nil
    end

    def bfs(target_value)
        
    end


end