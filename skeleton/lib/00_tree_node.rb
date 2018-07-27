class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value)
      @parent = nil
      @children = []
      @value = value
  end

  def parent=(node) #Passing in node object
    @parent.children.delete(self) unless @parent == nil

    unless node == nil
      @parent = node
      node.children << self
    else
      @parent = nil
    end
  end

  def add_child(child)
      child.parent = self
  end

end
