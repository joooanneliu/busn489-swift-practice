//
//  ContentView.swift
//  CatorDog
//
//  Created by Joanne Liu on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: AnimalModel
    // is used to declare a property that references an observed object
    
    
    var body: some View {
        VStack {
            // make data blank if model.animal.imageData is nil
            // if blank image, create as blank frame
            Image(uiImage: UIImage(data: model.animal.imageData ?? Data()) ?? UIImage())
                .resizable()
                .scaledToFit()
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Text("what is it?")
                    .font(.title)
                    .bold()
                    .padding(.leading, 10)
                Spacer()
                Button(action: {self.model.getAnimal()}, label: {
                    Text("Next").bold()
                })
            }
            List(model.animal.results) {
                result in HStack {
                    Text(result.imageLabel)
                    Spacer()
                    Text(String(format: "%.2f%%", result.confidence*100)
                         )
                }
            }
        }
        .onAppear(perform: model.getAnimal)
        .padding()
        
    }
}

#Preview {
    ContentView(model: AnimalModel())
}
