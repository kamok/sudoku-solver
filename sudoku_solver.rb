require_relative "board"

class Sudoku
  attr_reader :board
  def set_game(data)
    data = parse_import(data)
    @board = Board.new(data)
    @board.set_initial_values
    until @board.no_more_freebies? 
      @board.update_possible_values 
      @board.cells.each(&:solve)
    end
  end

  def solve
    answer = @board.solve!
    case answer 
      when false
        puts "This sudoku puzzle is invalid."
      else
        puts "Congrats you cheater!"
        puts "Here's your string #{answer.join}"
      end
  end

  private

  def parse_import(raw_data)
    raw_data.split("").map do |value|
      value == "." ? value = 0 : value.to_i
    end
  end

end

a = Sudoku.new
##the string below is world's hardest sudoku puzzle
a.set_game("8000000000036000000700902000500070000000457000001000300010000680085000100900004008")
a.solve