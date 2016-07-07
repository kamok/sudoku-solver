# sudoku-solver
Attempt to make a perfect sudoku solver. 

###Given Data Set:
From this URL, http://www2.warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/sudoku/

The given data is written in such a way that the first 9 numbers start from the first row. Then the next 9 numbers are the next row counting from top. And so on until the last 9 numbers which represents the bottom most row. A period is used to denote a blank space. 


###Solver's cell
Reference point is the top left, same as data. Starting from the first cell which is A1, A2, A3...A9. Next row is B1, B2, B3...B9. 

Todo:
<!-- 1. Figure out data structure of current sudoku questions.  -->
3. Need: individual representation of cells, rows, columns, and 3x3 blocks

Methodology:

def solved?
end

def scan_for_freebee
end

1. Scan every cell. Pinpoint cells that only have 1 possible solution. Fill them in.
2. Scan again. Repeat until solved? or no more possible.
3. Assuming branching appears where cells have 2+ possible answers, record branches.
4. Run scan_for_freebee with that branch until solved? or cells have 2+ possible.
5. Branch again.
6. Repeat until all branches are done.
7. Hopefully this method is fool-proof

