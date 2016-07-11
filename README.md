# sudoku-solver
Attempt to make a perfect sudoku solver. 

###Given Data Set:
From this URL, http://www2.warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/sudoku/

The given data is written in such a way that the first 9 numbers start from the first row. Then the next 9 numbers are the next row counting from top. And so on until the last 9 numbers which represents the bottom most row. A period is used to denote a blank space. 


###Solver's cell
Reference point is the top left, same as data. Starting from the first cell which is A1, A2, A3...A9. Next row is B1, B2, B3...B9. 

Todo:


Now: We have a board ready to begin solving. 

Cell.solve sets value of a cell if there's only one left in possible values

Remove and save a "possible_value"


Run through a test for every single board configuration.
3. Assuming branching appears where cells have 2+ possible answers, record branches.
4. Run scan_for_freebee with that branch until solved? or cells have 2+ possible.
5. Branch again.
6. Repeat until all branches are done.
7. Hopefully this method is fool-proof

Notes for solve:
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