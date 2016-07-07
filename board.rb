class Board

  attr_reader :cells, :rows

  ROW_ID = ["A","B","C","D","E","F","G","H","I"]
  COLUMN_ID = ["1","2","3","4","5","6","7","8","9"]

  def initialize
    @cells, @rows = [], []
    initialize_default_cells
    initialize_default_rows
    # initialize_default_columns
    # initialize_default_blocks
  end

  def row(id)
    @rows.each do |row|
      if row.id == id
        return row
      end
    end
  end

  def fill_initial_values(data)
    @rows.each do |row|
      row.cells.each do |cell|
        cell.value = data.shift
      end
    end

    require 'pry'
    binding.pry
    # data.each do |row_array|
    #   row_array.each do |value|

    # @rows

  end

  def initialize_default_cells
    cell_counter, row, column = 0, 0, 0
    block = 1
    until cell_counter == 81
      if cell_counter % 1 == 0 && cell_counter != 0
        column += 1
      end
      if cell_counter % 3 == 0 && cell_counter != 0
        row += 1
        column -= 3
      end
      if cell_counter % 9 == 0 && cell_counter != 0
        row -= 3 
        column += 3
        block += 1
      end
      if cell_counter % 27 == 0 && cell_counter != 0
        row += 3
        column -= 9
      end
      @cells << Cell.new(ROW_ID[row], COLUMN_ID[column], block)
      cell_counter += 1
    end
  end

  def initialize_default_rows
    row_counter = 0
    until row_counter == 9
      @rows << Row.new(ROW_ID[row_counter], @cells)
      row_counter += 1
    end
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
  attr_reader :row, :column, :block
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
  attr_reader :cells, :id
  def initialize(row_id, all_cells)
    @cells = []
    all_cells.map do |cell|
      if cell.row == row_id
        @cells << cell
      end
    end
    @id = row_id
  end
end

class Column
end

class Blocks
end