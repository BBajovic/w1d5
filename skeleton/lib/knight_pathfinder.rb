require_relative "00_tree_node"

class KnightPathFinder

  KNIGHT_MOVES = [
    [-2, 1],
    [-2,-1],
    [-1,-2],
    [-1, 2],
    [ 1,-2],
    [ 1, 2],
    [ 2,-1],
    [ 2, 1]
  ]

  attr_reader :root_node, :previous_moves

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @previous_moves = {start_pos => true}
    build_move_tree
  end

  def find_path(end_pos)
    node = root_node.bfs(end_pos)

    if node.nil?
      "Invalid input"
    else
      trace_path_back(node)
    end

  end

  private

  def build_move_tree
    line = []
    line << root_node

    until line.empty?
      current_position = line.shift
      valid_moves = get_valid_moves(current_position.value)
      valid_moves.each do |move|
        unless previous_moves.has_key?(move)
          p next_position = PolyTreeNode.new(move)
          line << next_position
          previous_moves[move] = true
          next_position.parent = current_position
        end
      end
    end
  end

  def trace_path_back(node)
    return [node.value] if root_node.value == node.value
    trace_path_back(node.parent) << node.value
  end

  def get_valid_moves(pos)
    x_idx, y_idx = pos
    valid_moves = []

    KNIGHT_MOVES.each do |move|
      x_move, y_move = move

      new_x = x_idx + x_move
      new_y = y_idx + y_move

      next unless new_x.between?(0, 7)
      next unless new_y.between?(0, 7)

      valid_moves << [new_x, new_y]
    end

    valid_moves
  end

end

if __FILE__ == $PROGRAM_NAME
  k = KnightPathFinder.new([0,0])
end
