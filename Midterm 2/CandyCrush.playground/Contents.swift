var ans:[[Int]] = []
// loop through and add all row combinations
for i in 0..<4 {
    let row1 = [i*4+1, i*4+2, i*4+3]
    let row2 = [i*4+2, i*4+3, i*4+4]
    ans.append(row1)
    ans.append(row2)
}

// columns
for i in 0..<4 {
    let col1 = [i+1, i+5, i+9]
    let col2 = [i+5, i+9, i+13]
    ans.append(col1)
    ans.append(col2)
}

let diag1 = [1, 2, 5, 6]
let diag2 = [3, 4, 7, 8]

// upper left to bottom right diagonals
for i in diag1 {
    ans.append([i, i+5, i + 10])
}

// upper right to bottom left diagonals
for i in diag2 {
    ans.append([i, i+3, i+6])
}

print(ans)
print(ans.count)

struct GameSquare{
    var id:Int //index of the tile in grid
    var candy:Candy // number to represent which candy in the square
    
    var image:Image{
        // returns the image associated to the candy
        // i.e.
    }
    
    static var reset:[GameSquare]{
        var squares = [GameSquare]()
            for index in 1...16 {
                squares.append(GameSquare(id: index))
            }
            return squares
    }
}

struct Candy{
    let candyPiece:CandyPiece
    var name:String
    var moves:[Int] = []
}

enum CandyPiece: String{
    case a, b, c, d, e
    var image:Image{
        Image(self.rawValue)
    }
}

func

func shiftDown(_ col:Int) {
    for squares in gameBoard column col
    
    //
}
