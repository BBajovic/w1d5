require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.winner != nil
      board.winner != evaluator
    elsif board.tied?
      false
    else
      if next_mover_mark == evaluator
        children.all?{ |child| child.losing_node?(evaluator) }
      else
        children.any?{ |child| child.losing_node?(evaluator) }
      end
    end
  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []

    board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |pos, col_idx|
        if pos.nil?
          new_board = board.dup
          new_board.rows[row_idx][col_idx] = next_mover_mark
          new_mark = switch_mark
          moves << TicTacToeNode.new(new_board, new_mark, [row_idx,col_idx])
        end
      end
    end
    moves
  end

  private

  def switch_mark
    next_mover_mark == :x ? :o : :x
  end

  # def deep_dup(arr)
  #   arr.map{|row| row.is_a?(Array) ? deep_dup(row) : row}
  # end
end
