//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Joanne Liu on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    
    // will not be destroyed when a view is recreated
    // define variables before body view
   @State private var messageString = ""
    
    var body: some View {
        // allows variables to be changed in views
        
        // without vstack, the image and text will go on separate views
        VStack {
            Image(systemName: "swift")
                // Add modifers tha return image before modifiers to view
                // i.e. resizable before foregroundstyle
                .resizable()
                .imageScale(.large)
                .foregroundStyle(.orange)
                .scaledToFit()
                .padding(.bottom)
            Text(messageString)
                .font(.title2)
            
            HStack {
                Button("Awesome") {
                    // this is the action perforned when button is pressed
                    // views are structs, which are valuetypes and immutable
                    // therefore, need to make messageString a state property
                    messageString = "You Are Awesome!!"
                }.buttonStyle(.borderedProminent)
                
                Button("Great") {
                    messageString = "You Are Great!"
                }.buttonStyle(.borderedProminent)
            }
            
           
        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
