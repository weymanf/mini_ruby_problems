require './trees'


class KnightPathFinder
  attr_accessor :move_tree_node
  def initialize(start)
    @pos = start

    @move_tree_node = build_move_tree(start)
  end

  def find_path(end_node)
    the_end = @move_tree_node.dfs(end_node)
    path = [the_end.value]
    until the_end.value == @pos
      the_end = the_end.parent
      path << the_end.value
    end
    path.reverse
  end

  def build_move_tree(pos)

    root = TreeNode.new(pos)
    queue = [root]
    already_contained = [root]

    until queue.empty?
      current_node = queue.shift
      already_contained << current_node.value
      possibles = get_possible_positions(current_node.value)
      possibles.each do |position|

        unless already_contained.include?(position)
          new_node = TreeNode.new(position)
          current_node.add(new_node)
          already_contained << position
          queue << new_node
        end

      end
    end
    root
  end

  def get_possible_positions(pos)
    x, y = pos

    [].tap do |array|
      possible_moves = [[2,1], [-2,1], [2,-1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]
      possible_moves.each do |move|
        n , i = move
        array << [x+n, y+i] if (0..8).cover?(x+n) && (0..8).cover?(y+i)
      end
    end
  end

end