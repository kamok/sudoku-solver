require_relative "board"

class Sudoku

  def set_game(data)
    data = parse_import(data)
    @board = Board.new
    @board.fill_initial_values(data)
  end

  def solve
    until @board.solved?
      puts "It ain't solved buddy!"
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
p a.set_game(".94...13..............76..2.8..1.....32.........2...6.....5.4.......8..7..63.4..8")