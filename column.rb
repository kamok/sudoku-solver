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