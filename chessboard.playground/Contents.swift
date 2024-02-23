// number of rows
var n:Int = 8

// creates n by n board initialized to 0s
var board = Array(repeating: Array(repeating: 0, count: n), count: n)

// print board
// for loop needs space around ..<
print("original board:")
for i in 0 ..< n {
    print(board[i])
}

print()


// how to pass in 2D array for functions?
// function returns whether putting a queen in the passed in location will still make the board valid
func isValid(_ board :[[Int]], _ n:Int, _ row: Int, _ col: Int) -> Bool {
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

// loop through board to see if valid
var row:Int = 0
var col:Int = 0

// array of size n to store the column for each row where the pieces r placed
var columns = Array(repeating: 0, count: n)

// for i in 0...10 {
while row < n {
    for j in columns[row] ..< n {
        if isValid(board, n, row, j) {
            board[row][j] = 1
            // print("curr j:", j)
            columns[row] = j // update column position
            // ++ does not exist in Swift
            row += 1
            break
        }
        // if on the last iteration and putting it in the last col doesn't work
        if (j == n - 1) {
            // backtrack one row
            row -= 1
            board[row][columns[row]] = 0
            // if already on last column, backtrack rows until there are available spots
            while(columns[row] == n-1) {
                row -= 1
                board[row][columns[row]] = 0
            }
            // reset all columns for rows after back to 0
            for h in row + 1 ..< n {
                columns[h] = 0
            }
            columns[row] += 1
        }
    }
    
    // Debugging
//    print(row, columns[row])
//    for i in 0 ..< n {
//        print(board[i])
//    }
    

}


 for i in 0 ..< n {
     print(board[i])
 }
