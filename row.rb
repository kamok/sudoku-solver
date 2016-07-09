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

  # def values
  #   values = []
  #   @cells.each do |cell|
  #     values << cell.value
  #   end
  #   values
  # end
end