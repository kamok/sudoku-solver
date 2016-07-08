require_relative "board"

class Sudoku
  attr_reader :board
  def set_game(data)
    data = parse_import(data)
    @board = Board.new
    @board.set_initial_values(data)
    @board.update_possible_values
    @board.display_board
  end

  def solve
                          #wrap this inside @board.solved?
    until @board.solved?      #change to @board.no_more_freebies?
      @board.cells.each do |cell|
        cell.solve
      end
      @board.update_possible_values
      @board.display_board
    end
                              #do the permutation brute force

    puts "Congrats. You're a cheater!"
  end

  private

  def parse_import(raw_data)
    single_large_array = 
    raw_data.split("").map do |value|
      value == "." ? value = 0 : value.to_i
    end
  end
end

a = Sudoku.new
a.set_game(".....8..3.16.2.9.7.3...46...........9.5...2...2.13...9..3....2..7...5.........4..")
a.solve
# a.board.cells.each do |cell| 
#   p cell
# end