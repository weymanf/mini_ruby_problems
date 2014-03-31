class TreeNode

  attr_accessor :parent, :child_array, :value

  def initialize(value)
    @value = value
    @parent = self.parent
    @child_array = []
  end

  def remove(child_node)
    unless child_node.parent.nil?
      child_node.parent.child_array.delete(child_node)
      child_node.parent = nil
    end
    return self
  end

  def add(child_node)
    remove(child_node)
    child_array << child_node
    child_node.parent = self
    self
  end

  # def dfs(value)
  #   return self if self.value == value
  #   y = self
  #   self.child_array.each do |child|
  #     y = child.dfs(value) if child.dfs(value).value == value
  #   end
  #   return nil if y.parent == nil
  #   y
  # end

  def dfs(value)
    return self if self.value == value
    self.child_array.each do |child|
      child_result = child.dfs(value)
      return child_result unless child_result.nil?
    end
    nil
  end


  def bfs(value)
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      queue += current_node.child_array
      return current_node if current_node.value == value
    end
    nil
  end

  # def bfs_rec(value)
  #   return self if self.value == value
  #   nil
  # end

end

a = TreeNode.new('a')
b = TreeNode.new('b')
c = TreeNode.new('c')

a.add(b).add(c)
puts "looking for a"
puts a.dfs('a')
puts "looking for b"
puts a.dfs('b')
puts "looking for c"
puts a.dfs('c')
puts "looking for d"
puts a.dfs('d')