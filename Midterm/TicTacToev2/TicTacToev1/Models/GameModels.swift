//
//  GameModels.swift
//  TicTacToev1
//
//  Created by Rajiv Mukherjee on 2/19/24.
//

import SwiftUI

enum GameType{
    case single, bot, peer, undetermined
    
    var description:String{
        switch self{
            //lower case self is a current instance of the structure
            //upper case Self is the the structure itself
        case .single:
            return "Share your device and play against a friend."
            
        case .bot:
            return "Play againat the device."
            
        case .peer:
            return "Invite someone near you with the app to play."
            
        case .undetermined:
            return ""
        }
    }
    
}

enum GamePiece: String{
    case x, o
    var image:Image{
        Image(self.rawValue)
    }
}


struct Player{
    let gamePiece:GamePiece
    var name:String
    var moves:[Int] = []
    var isCurrent = false
    
    var isWinner:Bool{
        for moves in Moves.winningMoves{
            if moves.allSatisfy(self.moves.contains){
                return true
            }
        }
        return false
    }
}

func calcWinningMoves() ->[[Int]] {
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
    
    return ans
}

enum Moves{
    static var all = [1,2,3,4,5,6,7,8,9]

//    static var winningMoves = [[1,2,3],[4,5,6],[7,8,9],
//    [1,4,7],[2,5,8],[3,6,9],
//    [1,5,9], [3,5,7]]
    
    static var winningMoves = calcWinningMoves()
}

