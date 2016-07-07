class Board
  attr_reader :cells, :rows, :columns

  ROW_ID = ["A","B","C","D","E","F","G","H","I"]
  COLUMN_ID = ["1","2","3","4","5","6","7","8","9"]

  def initialize
    @cells, @rows, @columns = [], [], []
    initialize_default_cells
    initialize_default_rows
    initialize_default_columns
    # initialize_default_blocks
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

  # def update_board
    #this method run "update" on all the observers, eg
    #Blocks, Row, Column, Cell
  # end

  def solved?
    #Row says OK
    #Column says OK
    #Block says OK
  end
end

class Cell
  attr_reader :row, :column, :block
  attr_accessor :possible_values, :value
  def initialize(x, y, block)
    @row = x
    @column = y
    @block = block
    @possible_values = [1,2,3,4,5,6,7,8,9]
    @value = 0
  end

  def update
    #looks at 
  end
end

class Row
  attr_reader :cells, :id
  # attr_accessor :row_values
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
  attr_reader :cells, :id
  # attr_accessor :column_values
  def initialize(column_id, all_cells)
    @cells = []
    all_cells.map do |cell|
      if cell.column == column_id
        @cells << cell
      end
    end
    @id = column_id
  end
end

class Blocks
end