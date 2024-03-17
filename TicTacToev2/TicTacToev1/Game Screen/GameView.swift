//
//  GameView.swift
//  TicTacToev1
//
//  Created by Rajiv Mukherjee on 2/26/24.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var game:GameService
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                //run an if check on the array of players and both are current then setboth as false
                if [game.player1.isCurrent, game.player2.isCurrent]
                    .allSatisfy({$0 == false}){
                        Text("Select a player to start")
                    }
                
                // player 1 and player 2 buttons
                HStack{
                    Button(game.player1.name){
                        // action for when button is pressed
                        game.player1.isCurrent = true
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(game.player1.isCurrent ?    Color.green: Color.gray)
                    )
                    .foregroundColor(.white)
                    
                    Button(game.player2.name){
                        game.player2.isCurrent = true
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(game.player2.isCurrent ?    Color.green: Color.gray)
                    )
                    .foregroundColor(.white)
                    
                    
                }//end of HStack
                // buttons disabled when gameStarted is true
                .disabled(game.gameStarted)
                
                //create game board here
                VStack{
                    HStack{
                        // for each iteration, index = 0, 1, and then 2
                        // creates new instance of SquareView for each square
                        ForEach(0...2, id: \.self){
                            index in SquareView(index: index)
                        }
                    }
                    
                    HStack{
                        ForEach(3...5, id: \.self){
                            index in SquareView(index: index)
                        }
                    }
                    
                    HStack{
                        ForEach(6...8, id: \.self){
                            index in SquareView(index: index)
                        }
                    }
                }
                //
                .disabled(game.boardDisabled)
                //display winner when game is over
                VStack{
                    if game.gameOver {
                        Text("Game Over")
                        
                        if game.possibleMoves.isEmpty {
                            Text("Nobody wins")
                        } else {
                            Text("\(game.currentPlayer.name) wins!")
                        }
                        
                        Button("New Game") {
                            game.reset()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .font(.largeTitle)
                Spacer()
                
            }.toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("End Game"){
                        dismiss()
                    }.buttonStyle(.bordered)
                }
            }//end of toolbar
            .navigationTitle("Tic Tac Toe")
            .onAppear{
                game.reset()
            }
        }//end of navigation stack
    }
}

#Preview {
    GameView()
        .environmentObject(GameService())
}
