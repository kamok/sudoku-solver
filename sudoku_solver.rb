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
    until @board.no_more_freebies?      #change to @board.no_more_freebies?
      @board.cells.each(&:solve)
      @board.update_possible_values
      @board.display_board
    end
                              #do the permutation brute force
                              #check each permutation. is_permutation_valid?

    puts "Congrats. Let's build an algorithm to do depth first search !"
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
a.set_game("39.82.7..8.15...69.2.16.4.3..2.96.58935...6.2.6.752.3.7.3941...2...3759..19...347")
a.solve
# a.board.cells.each do |cell| 
#   p cell
# end