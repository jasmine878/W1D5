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

    def add_child(child_node)
        @parent = child_node
    end

    def remove_child(child_node)

    end

end