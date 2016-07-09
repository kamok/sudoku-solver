require_relative "board"

class Sudoku
  attr_reader :board
  def set_game(data)
    data = parse_import(data)
    @board = Board.new
    @board.set_initial_values(data)
    until @board.no_more_freebies? 
      @board.update_possible_values 
      @board.cells.each(&:solve)
      @board.display_board
    end
  end

  def solve               
    # loop do
    #   @board.backtrack     Reverts board to state before branching
    #   loop do
          #tries to solve the board within a branch
    #     break if @board.has_conflict? || @board.solved?
    #   end
    #   break if @board.solved?
    # end

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
# a.solve
# a.board.cells.each do |cell| 
#   p cell
# end