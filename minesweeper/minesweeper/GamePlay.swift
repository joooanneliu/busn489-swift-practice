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
    
    @Published var gameStart = false
    @Published var gameOver = false
    @Published var flagMode = false
    @Published var flagCount:Int = 0
    @Published var gameWin = false
    
    
    func setUpBoard(at index:Int) {
        // put 10 mines randomly
        var mines = Set<Int>()
        var count:Int = 0
        while(count < 10) {
            let randomNum:Int = Int.random(in: 0..<64)
            if (!mines.contains(randomNum) && randomNum != index) {
                mines.insert(randomNum)
                gameBoard[randomNum].mine = true
                setNum(at: index)
                if(gameBoard[index].num != 0) {
                    gameBoard[randomNum].mine = false
                } else {
                    count += 1
                }
            }
        }
        
        // print(mines)

        for i in 0...63{
            if(!gameBoard[i].mine) {
                setNum(at: i)
            }
        }
        
        reveal(at: index)
    }
    
    func reset() {
        gameBoard = GameSquare.reset
        gameStart = false
        gameOver = false
        gameWin = false
        flagCount = 0
        flagMode = false
    }

    func setNum(at index:Int) {
        // set pos at square diagonally above and left of index
        let row:Int = index / 8
        let col:Int = index % 8
        // var pos:Int = index - 10
        var count:Int = 0
        
        var currRow:Int = row - 1
        for _ in 0..<3 {
            if(currRow >= 0 && currRow < 8) {
                var currCol:Int = col - 1
                for _ in 0..<3 {
                    if(currCol >= 0 && currCol < 8) {
                        let pos = currRow * 8 + currCol
                        if(gameBoard[pos].mine) {
                            // print("mine at \(pos)")
                            count += 1
                        }
                    }
                    currCol += 1
                }
            }
            currRow += 1
        }
        gameBoard[index].num = count
    }
    
    // reveals all empty squares around index, forming a border of numbers around
    func reveal(at index:Int) {
        let row:Int = index / 8
        let col:Int = index % 8
        
        var currRow:Int = row - 1
        var neighbors = Set<Int>()
        for _ in 0..<3 {
            if(currRow >= 0 && currRow < 8) {
                var currCol:Int = col - 1
                for _ in 0..<3 {
                    if(currCol >= 0 && currCol < 8) {
                        let pos = currRow * 8 + currCol
                        if(!gameBoard[pos].clicked) {
                            gameBoard[pos].clicked = true
                            if(gameBoard[pos].num == 0 && pos != index) {
                                // reveal(at: pos)
                                neighbors.insert(pos)
                            }
                        }
                    }
                    currCol += 1
                }
            }
            currRow += 1
        }
        // print(neighbors)
        for num in neighbors {
            // call recursively
            reveal(at: num)
        }
    }
    
    func revealAll() {
        for i in 0...63{
            if(!gameBoard[i].clicked) {
                gameBoard[i].clicked = true
            } else {
                if(gameBoard[i].flagMode && !gameBoard[i].mine) {
                    gameBoard[i].flagMode = false
                }
            }
        }
    }
    
    func onAction(at index:Int) {
        if(!gameStart) {
            setUpBoard(at: index)
            gameStart = true
        }
        if(!gameBoard[index].clicked) {
            gameBoard[index].clicked = true
            
            if(flagMode) {
                gameBoard[index].flagMode = true
                flagCount += 1
            } else {
                if(gameBoard[index].mine) {
                    gameOver = true
                    revealAll()
                } else if(gameBoard[index].num == 0) {
                    reveal(at: index)
                }
            }
            gameWin = checkWin()
        } else {
            // if clicked and in flagMode
            if(flagMode) {
                gameBoard[index].clicked = false
                gameBoard[index].flagMode = false
                flagCount -= 1
            }
        }
    }
    
    // returns whether user has won the game
    func checkWin()-> Bool {
        // all squares have been clicked and no mines, or there are no none-mine squares to click on = win
        if(gameOver) {
            return false
        }
        for i in 0...63{
            if(!gameBoard[i].clicked && !gameBoard[i].mine) {
                // print(i)
                return false
            }
        }
        return true
    }
    
}

