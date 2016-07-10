require_relative "board"

class Sudoku
  attr_reader :board
  def set_game(data)
    data = parse_import(data)
    @board = Board.new
    @board.set_initial_values(data)
    until @board.no_more_freebies? 
      @board.update_possible_values 
      @board.cells.each(&:solve)
      @board.display_board
    end
  end

  def solve
    # convert possible_values data into many @board objects
    # check each for solved?    
    # need to save state for every branch? cell.backlog should help us keep track on what we
    # have to test left. 

    # Approach 1
    # loop do
        # cell.backlog = []
        # cell.possible_values = [1,2]
        # for each cell
    #   @board.backtrack     Reverts board to state before branching
    #   loop do
          #tries to solve the board within a branch
            #@board.solve 
              #cell.backlog << cell.possible_values until cell.possible_values.count == 1
              #cell.solve

              #Either do this next step without changning possible_values or find way to save state
              #@board.update_possible_values 
    #     break if @board.has_conflict? || @board.solved? #deletes the branch if has_conflict
    #   end
    #   break if @board.solved?
    # end

    # Approach 2
    # Convert current board and possible values into a tree
    # Write out every single possible solution as a lot of strings in embedded hashes
    # Check them with DFS
    puts "Congrats. Let's build an algorithm to do depth first search !"
  end

  private

  def parse_import(raw_data)
    single_large_array = 
    raw_data.split("").map do |value|
      value == "." ? value = 0 : value.to_i
    end
  end
end

a = Sudoku.new
a.set_game("39.82.7..8.15...69.2.16.4.3..2.96.58935...6.2.6.752.3.7.3941...2...3759..19...347")
# a.solve
# a.board.cells.each do |cell| 
#   p cell
# end