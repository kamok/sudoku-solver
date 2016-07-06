# sudoku-solver
Attempt to make a perfect sudoku solver. 

###Given Data Set:
From this URL, http://www2.warwick.ac.uk/fac/sci/moac/people/students/peter_cock/python/sudoku/

Given a chess board, where A-H goes from left to right, and 1-8 goes from bottom to top, the easy data set in data/easy.txt employs the same scheme for A-H, BUT 1-8 starts from top to bottom. Also note that the Chess board has 8 columns and rows vs the Sudoku board with 9 columns and rows.

The given data is written in such a way that the first 9 numbers are I1, I2, I3...I9. Then the next 9 numbers are the next row counting from top of H1, H2, H3...H9. And so on until the last 9 numbers which represents the bottom most row. A period is used to denote a blank space. 


Todo:
1. Figure out data structure of current sudoku questions. 
2. Find a way to insert them into cells.
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

