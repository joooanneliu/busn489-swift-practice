//
//  SquareView.swift
//  minesweeper
//
//  Created by Joanne Liu on 3/18/24.
//


import SwiftUI

struct SquareView: View {
    
    @EnvironmentObject var game: GamePlay
    @State private var pressed:Bool = false
    let index: Int
    
    var body: some View {
        Button() {
            // value += 1
            game.onAction(at: index)
        } label: {
            ZStack {
                game.gameBoard[index].image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40) // Adjust the size of the image
                let value:Int = game.gameBoard[index].num
                // when clicked and not in gameMode
                if(game.gameBoard[index].clicked && !game.gameBoard[index].flagMode && value > 0) {
                    Text("\(value)")
                } else {
                    Text("")
                }
            }
        }.disabled(game.gameWin)
        
    }
}

#Preview {
    //index set to 1 just for previewing 1 tile
    SquareView(index: 1)
        .environmentObject(GamePlay())
}
