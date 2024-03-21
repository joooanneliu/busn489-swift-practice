//
//  GamePlay.swift
//  minesweeper
//
//  Created by Joanne Liu on 3/18/24.
//

import SwiftUI
@MainActor

class GamePlay: ObservableObject {
    @Published var gameBoard = GameSquare.reset
    
    @Published var gameOver = false
    @Published var flagMode = true
    @Published var flagCount:Int = 0
    
    func setUpBoard() {
        // put 10 mines randomly
        var mines = Set<Int>()
        var count:Int = 0
        while(count < 10) {
            let randomNum:Int = Int.random(in: 0..<64)
            if (!mines.contains(randomNum)) {
                mines.insert(randomNum)
                count += 1
            }
        }
        
        for index in mines {
            gameBoard[index].mine = true
        }
        
        if(!gameBoard[11].mine) {
            setNum(at: 11)
        }
//        for i in 0...64 {
//            if(!gameBoard[i].mine) {
//                setNum(at: i)
//            }
//        }
    }
    
    func reset() {
        gameBoard = GameSquare.reset
    }
    
    
    // 0 1 2 3 4 5 6 7
    // 8 9 10 11 12 13 14 15
    // 16 17 18 19 20 21 22 23

    // 11: 2, 3, 4, 10, 12, 18, 19, 20
    func setNum(at index:Int) {
        // set pos at square diagonally above and left of index
        var pos:Int = index - 10
        var count:Int = 0
        
        // loop through row above, row, and row below
        for _ in 0..<3 {
            // loop through left center and right
            for _ in 0..<3 {
                pos += 1
                print(pos)
                if(withinRange(index: pos)) {
                    if(gameBoard[pos].mine) {
                        // print("mine at \(pos)")
                        count += 1
                    }
                }
            }
            pos += 5
        }
        gameBoard[index].num = count
    }
    
    func withinRange(index:Int)->Bool {
        index >= 0 && index < 64
    }
    func onAction(at index:Int) {
        if(!gameBoard[index].clicked) {
            gameBoard[index].clicked = true
            
            if(flagMode) {
                gameBoard[index].flagMode = true
                flagCount += 1
            }
            
        }
    }
}

