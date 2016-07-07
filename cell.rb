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

  def solve
    @value = possible_values.join.to_i if possible_values.count == 1
  end
end