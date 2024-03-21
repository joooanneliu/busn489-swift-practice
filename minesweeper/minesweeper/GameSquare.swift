//
//  GameSquare.swift
//  minesweeper
//
//  Created by Joanne Liu on 3/20/24.
//

import SwiftUI

/*
 Different possible status of squares:
 mine - flagged (flag)
 mine - clicked (mine)
 mine - unclicked (grass)
 blank - clicked (blankSquare)
 blank - unclicked (grass)
 */

struct GameSquare {
    var id:Int // index of square on board
    
    var mine:Bool = false // represents whether it is a mine or not
    var clicked:Bool = false // represents whether it has been clicked
    var flagMode:Bool = false // represents whether flagmode is on when clicked
    // var gameOver:Bool // represents whether mine has been clicked
    var num:Int = 0 // number of mines around
    
    // image representing the status of square
    var image:Image {
        // case 1: unclicked
        if !clicked {
            return Image("grass")
        }
        
        // case 2: clicked and on flag mode
        if flagMode {
            return Image("flag")
        }
        
        // case 3: clicked and not on flag mode, safe area
        if !mine {
            return Image("blankSquare")
        }
        
        // last case: clicked and not on flag mode, a mine
        return Image("mine")
        
    }
    
    // function used to reset/initialize board
    static var reset:[GameSquare]{
        var squares = [GameSquare]()
            for index in 1...64 {
                squares.append(GameSquare(id: index))
            }
            return squares
    }
}
