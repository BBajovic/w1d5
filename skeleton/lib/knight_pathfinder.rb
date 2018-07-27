require_relative "00_tree_node"

class KnightPathFinder

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @valid_moves = Hash.new(0)
  end

  def build_move_tree

  end

  private

  def get_possible_moves(pos)
    x_idx, y_idx = pos
    possible_moves = []

    [-1,1].each do |adder_x|
      new_x = x_idx + adder_x
      next unless new_x.between?(0, 7)

      [-2,2].each do |adder_y|
        new_y = y_idx + adder_y
        next unless new_y.between?(0, 7)

        possible_moves << [new_x, new_y]
      end
    end


    [-2,2].each do |adder_x|
      new_x = x_idx + adder_x
      next unless new_x.between?(0, 7)

      [-1,1].each do |adder_y|
        new_y = y_idx + adder_y
        next unless new_y.between?(0, 7)

        possible_moves << [new_x, new_y]
      end
    end

    possible_moves
  end

end
