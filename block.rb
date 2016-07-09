class Block
  attr_reader :cells, :id
  def initialize(block_id, all_cells)
    @cells = []
    all_cells.map do |cell|
      if cell.block == block_id.to_i
        @cells << cell
      end
    end
    @id = block_id
  end
end