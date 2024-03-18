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
   @State private var messageString = "hi!"
    // initailize to space will make border box large enough for single line
    // command click gives definition of code
    var body: some View {
        // allows variables to be changed in views
        // without vstack, the image and text will go on separate views
        ZStack {
            Rectangle()
                .fill(
                    // Color("PinkTan").gradient
                    Gradient(colors:[.white, .blue])
                ) //.gradient only available for rectangle.fill, not color
                .ignoresSafeArea()
            VStack {
    //            Image(systemName: "swift")
    //                // Add modifers tha return image before modifiers to view
    //                // i.e. resizable before foregroundstyle
    //                .resizable()
    //                .imageScale(.large)
    //                .foregroundStyle(.orange)
    //                .scaledToFit()
    //                .padding(.bottom)
                Text("You have skills!")
                    .font(.largeTitle)
                    .fontWeight(.black) // .black is also a thickness
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("PastelBlue"))
                    .cornerRadius(15)
                
                Spacer()
                Text(messageString)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .minimumScaleFactor(0.5) // shrinks text to 50% of font size if needed
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    // .padding() // adds padding around the text in the box
                    .frame(width: 300, height: 150) // border draws around the frame, not just the text
                    .border(.orange, width: 1)
                Spacer() // puts max space between the two so first item is at the top of the screen, second at the bottom
                
                HStack {
                    // double click to add brackets
                    Button("Awesome") {
                        // this is the action perforned when button is pressed
                        // views are structs, which are valuetypes and immutable
                        // therefore, need to make messageString a state property
                        messageString = "You Are Awesome!!"
                    }.buttonStyle(.borderedProminent)
                    
                    Button("Great") {
                        messageString = "You Are Great!"
                    }.buttonStyle(.borderedProminent)
                } // end of hstack
                .border(.purple)
                .padding() // add some padding around hstack so it's not at the very bottom of the screen
                .tint(Color("PastelBlue")) // changes color of everything inside the HStack
                
               
            
            }
            .padding()
        } // don't put ignores safe Area here since the whole stack will ignore it; put it after color

    }
}

#Preview {
    ContentView()
}
