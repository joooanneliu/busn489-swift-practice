// number of rows
var n:Int = 8

// creates n by n board initialized to 0s
var board = Array(repeating: Array(repeating: 0, count: n), count: n)

// print board
for i in 0 ..< n {
    print(board[i])
}

var row:Int = 0
var col:Int = 0

// how to pass in 2D array for functions?
func isValid(_board :[[Int]], _ n:Int, _ row: Int, _ col: Int) -> Bool {
    // check if there is already one placed in row
    for i in 0 ..< n {
        if(board[row][i] == 1) {
            return false
        }
    }
    
    // check the column
    for i in 0 ..< n {
        if(board[i][col] == 1) {
            return false
        }
    }
    
    // check for diagonals
    for i in 0 ..< n {
        if(row + i >= 0 && row + i < n && col + i >= 0 && col + i < n) {
            if(board[row + i][col + i] == 1) {
                return false
            }
        }
        if(row - i >= 0 && row - i < n && col - i >= 0 && col - i < n) {
            if(board[row - i][col - i] == 1) {
                return false
            }
        }
    }
    
    // return true if no queen placed in same row, col or diagonal
    return true
}


