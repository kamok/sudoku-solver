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
#"800000000003600000070090200050007000000045700000100030001000068008500010090000400"
a.set_game(".94...13..............76..2.8..1.....32.........2...6.....5.4.......8..7..63.4..8")
a.solve