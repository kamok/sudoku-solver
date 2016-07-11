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

  def values
    [].tap do |value_collection|
      @cells.each do |cell|
        value_collection << cell.value if cell.value != 0
      end
    end
  end
end