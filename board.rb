class Board

  ROW_ID = ["A","B","C","D","E","F","G","H","I"]
  COLUMN_ID = ["1","2","3","4","5","6","7","8","9"]

  def initialize(data)
    @cells = []
    initialize_cells


    # update_board
  end

  def initialize_cells
    #increases row by 1 every 3 Cell.new, -3 every 9, +3 every 27
    #increases column by 1 every Cell.new, -3 every 3, +3 every 9, -9 every 27
    #increases by 1 per 9 Cell.new

    Cell.new(ROW_ID[0], COLUMN_ID[0], 1)
    Cell.new(ROW_ID[0], COLUMN_ID[1], 1)
    Cell.new(ROW_ID[0], COLUMN_ID[2], 1)
    Cell.new(ROW_ID[1], COLUMN_ID[0], 1)
    Cell.new(ROW_ID[1], COLUMN_ID[1], 1)
    Cell.new(ROW_ID[1], COLUMN_ID[2], 1)
    Cell.new(ROW_ID[2], COLUMN_ID[0], 1)
    Cell.new(ROW_ID[2], COLUMN_ID[1], 1)
    Cell.new(ROW_ID[2], COLUMN_ID[2], 1)

    Cell.new(ROW_ID[0], COLUMN_ID[3], 2)
    Cell.new(ROW_ID[0], COLUMN_ID[4], 2)
    Cell.new(ROW_ID[0], COLUMN_ID[5], 2)
    Cell.new(ROW_ID[1], COLUMN_ID[3], 2)
    Cell.new(ROW_ID[1], COLUMN_ID[4], 2)
    Cell.new(ROW_ID[1], COLUMN_ID[5], 2)
    Cell.new(ROW_ID[2], COLUMN_ID[3], 2)
    Cell.new(ROW_ID[2], COLUMN_ID[4], 2)
    Cell.new(ROW_ID[2], COLUMN_ID[5], 2)


    Cell.new(ROW_ID[0], COLUMN_ID[6], 3)
    Cell.new(ROW_ID[0], COLUMN_ID[7], 3)
    Cell.new(ROW_ID[0], COLUMN_ID[8], 3)
    Cell.new(ROW_ID[1], COLUMN_ID[6], 3)
    Cell.new(ROW_ID[1], COLUMN_ID[7], 3)
    Cell.new(ROW_ID[1], COLUMN_ID[8], 3)
    Cell.new(ROW_ID[2], COLUMN_ID[6], 3)
    Cell.new(ROW_ID[2], COLUMN_ID[7], 3)
    Cell.new(ROW_ID[2], COLUMN_ID[8], 3)

    Cell.new(ROW_ID[3], COLUMN_ID[0], 4)
    Cell.new(ROW_ID[3], COLUMN_ID[1], 4)
    Cell.new(ROW_ID[3], COLUMN_ID[2], 4)
    Cell.new(ROW_ID[4], COLUMN_ID[0], 4)
    Cell.new(ROW_ID[4], COLUMN_ID[1], 4)
    Cell.new(ROW_ID[4], COLUMN_ID[2], 4)
    Cell.new(ROW_ID[5], COLUMN_ID[0], 4)
    Cell.new(ROW_ID[5], COLUMN_ID[1], 4)
    Cell.new(ROW_ID[5], COLUMN_ID[2], 4)
  end

  # def update_board
    #this method run "update" on all the observers, eg
    #Blocks, Row, Column, Cell
  # end

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
end

class Row
end

class Column
end

class Blocks
end

# [[0, 9, 4, 0, 0, 0, 1, 3, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 7, 6, 0, 0, 2], [0, 8, 0, 0, 1, 0, 0, 0, 0], [0, 3, 2, 0, 0, 0, 0, 0, 0], [0, 0, 0, 2, 0, 0, 0, 6, 0], [0, 0, 0, 0, 5, 0, 4, 0, 0], [0, 0, 0, 0, 0, 8, 0, 0, 7], [0, 0, 6, 3, 0, 4, 0, 0, 8]]