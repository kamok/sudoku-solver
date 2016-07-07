class Board

  ROW_ID = ["A","B","C","D","E","F","G","H","I"]
  COLUMN_ID = ["1","2","3","4","5","6","7","8","9"]

  def initialize(data)
    # @cells = 


    # update_board
  end

  def update_board
    #this method run "update" on all the observers, eg
    #Blocks, Row, Column, Cell
  end

  def solved?
    true
  end
end

class Cell
  attr_reader :x, :y, :block
  attr_accessor :possible_numbers, :value
  def initialize(x, y, block)
    @row = x
    @column = y
    @block = block
    @possible_numbers = [1,2,3,4,5,6,7,8,9]
    @value = 0
  end
  # def update
  # end
end

class Row
end

class Column
end

class Blocks
end

# [[0, 9, 4, 0, 0, 0, 1, 3, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 7, 6, 0, 0, 2], [0, 8, 0, 0, 1, 0, 0, 0, 0], [0, 3, 2, 0, 0, 0, 0, 0, 0], [0, 0, 0, 2, 0, 0, 0, 6, 0], [0, 0, 0, 0, 5, 0, 4, 0, 0], [0, 0, 0, 0, 0, 8, 0, 0, 7], [0, 0, 6, 3, 0, 4, 0, 0, 8]]