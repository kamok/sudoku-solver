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
    until @board.solved?
      @board.cells.each do |cell|
        cell.solve
      end
      @board.update_possible_values
      @board.display_board
      # require 'pry'
      # binding.pry
    end
    puts "Congrats."
  end

  private

  def parse_import(raw_data)
    single_large_array = 
    raw_data.split("").map do |value|
      value == "." ? value = 0 : value.to_i
    end

    # This code makes everything into nested form by row.
    # [].tap do |nested_data|
    #   until single_large_array.empty?
    #     row = []
    #     9.times do 
    #       row << single_large_array.shift.to_i
    #     end
    #     nested_data << row
    #   end
    # end

  end
end

a = Sudoku.new
a.set_game("39.82.7..8.15...69.2.16.4.3..2.96.58935...6.2.6.752.3.7.3941...2...3759..19...347")
a.solve
# a.board.cells.each do |cell| 
#   p cell.value
# end