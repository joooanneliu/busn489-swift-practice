//
//  ContentView.swift
//  minesweeper
//  Main Game View
//  Created by Joanne Liu on 3/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var game:GamePlay
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Flag Count: \(game.flagCount)")
//                Button("start") {
//                    game.setUpBoard()
//                }
                
                Button("reset") {
                    game.reset()
                }
                .disabled(!game.gameStart)
            }
            Spacer()
            // build 8 by 8 board
            VStack (spacing:0){
                ForEach(0..<8) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<8, id: \.self) { col in
                            let count:Int = row * 8 + col
                            SquareView(index: count)
                        }
                    }
                }
                if(game.gameOver) {
                    Text("Oh no! You hit a mine!").padding(.top, 20)
                    Text("Click reset to restart")
                }
                if(!game.gameStart) {
                    Text("Click on any square to begin").padding(.top, 20)
                }
            } // end of board VStack
            
            Spacer()
            HStack {
                Button(action: {
                    game.flagMode = true
                }) {
                    Image("flagMode")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(5)
                        .background(game.flagMode ? Color("selectGray") : Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                Button(action: {
                    game.flagMode = false
                }) {
                    Image("digMode")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(5)
                        .background(!game.flagMode ? Color("selectGray") : Color.white)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                
            } // end of mode button HStack

            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(GamePlay())
}

