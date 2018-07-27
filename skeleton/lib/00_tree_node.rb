class PolyTreeNode
  attr_accessor :parent, :children, :value

  def initialize(value)
      @parent = nil
      @children = []
      @value = value
  end

  def parent=(node) #Passing in node object
    @parent.children.delete(self) unless @parent.nil?
    @parent = node

    node.children << self unless node.nil?

  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    unless children.include?(child)
      raise "Thats not your child"
    end
    child.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    return nil if children.empty?

    children.each do |child|
      found = child.dfs(target)
      return found unless found.nil?
    end

    nil
  end

  def bfs(target)
    line = []
    line << self

    until line.empty?
      looking_at = line.shift
      if looking_at.value == target
        return looking_at
      else
        looking_at.children.each do |child|
          line << child
        end
      end
    end

    nil
  end

end
