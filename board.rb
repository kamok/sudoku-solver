require_relative "cell"
require_relative "row"
require_relative "column"
require_relative "block"

class Board
  attr_reader :cells, :rows, :columns, :blocks

  ROW_ID = ["A","B","C","D","E","F","G","H","I"]
  COLUMN_ID = ["1","2","3","4","5","6","7","8","9"]
  BLOCK_ID = COLUMN_ID

  def initialize
    @cells, @rows, @columns, @blocks = [], [], [], []
    initialize_default_cells
    initialize_default_rows
    initialize_default_columns
    initialize_default_blocks
  end

  # def row(id)
  #   @rows.each do |row|
  #     if row.id == id
  #       return row
  #     end
  #   end
  # end

  def set_initial_values(data)
    #write it inside the cell.value
    @rows.each do |row|
      row.cells.each do |cell|
        cell.value = data.shift
      end
    end
  end

  def update_possible_values                  # This method should remove possible_values from all cells given 
                                              # the current state of the board.
    @cells.each do |cell|   
      if cell.value != 0                      #if a block has value, then all possible_values are deleted
        cell.possible_values.clear 
      end
    end

    @rows.each do |row|
      row_values = []
      row.cells.each do |cell|
        row_values << cell.value if cell.value > 0  #row_values array has all values of that row 
      end

      row.cells.each do |cell|
        cell.possible_values -= row_values
      end
    end

    @columns.each do |column|
      column_values = []
      column.cells.each do |cell|
        column_values << cell.value if cell.value > 0
      end

      column.cells.each do |cell|
        cell.possible_values -= column_values
      end
    end

    @blocks.each do |block|
      block_values = []
      block.cells.each do |cell|
        block_values << cell.value if cell.value > 0
      end

      block.cells.each do |cell|
        cell.possible_values -= block_values
      end
    end
  end

  def initialize_default_cells
    cell_counter, row, column = 0,0,0
    block = 1

    until cell_counter == 81
      1.times do 
        break if cell_counter == 0
        if cell_counter % 1 == 0
          column += 1
        end
        if cell_counter % 3 == 0
          block += 1
        end
        if cell_counter % 9 == 0
          column -= 9
          row += 1
          block -= 3
        end
        if cell_counter % 27 == 0
          block += 3
        end
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

  def initialize_default_columns
    column_counter = 0
    until column_counter == 9
      @columns << Column.new(COLUMN_ID[column_counter], @cells)
      column_counter += 1
    end
  end

  def initialize_default_blocks
    block_counter = 0
    until block_counter == 9
      @blocks << Block.new(BLOCK_ID[block_counter], @cells)
      block_counter += 1
    end
  end

  # def update_board
    #this method run "update" on all the observers, eg
    #Blocks, Row, Column, Cell
  # end

  def solved?
    #Row says OK
    # solved_rows = 0
    # rows.each do |row|
    #   row.cells.each do |cell|
    #     if cell.value != 0

    #Column says OK
    #Block says OK
    solved_cells = 0
    cells.each do |cell|
      if cell.value != 0
        solved_cells += 1
      end
    end
    if solved_cells == 81
      return true
    else
      return false
    end
  end
end