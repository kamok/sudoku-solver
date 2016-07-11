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
    @board.solve!
    puts "Congrats."
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
a.set_game("100900000080070400405002000000000003900036070000010090000240000204501008000000700")
a.solve