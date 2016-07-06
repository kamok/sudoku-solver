class Sudoku
  def import(data)
    data = parse_import(data)
    # Board.new(data)
  end

  private

  def parse_import(raw_data)
    single_large_array = 
    raw_data.split("").map do |value|
      value == "." ? value = 0 : value
    end

    [].tap do |nested_data|
      until single_large_array.empty?
        row = []
        9.times do 
          row << single_large_array.shift.to_i
        end
        nested_data << row
      end
    end
    
  end
end

a = Sudoku.new
p a.import(".94...13..............76..2.8..1.....32.........2...6.....5.4.......8..7..63.4..8")


# class Board
#   def initialize

#   end
# end