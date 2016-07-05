# sudoku-solver
Attempt to make a perfect sudoku solver. 

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

