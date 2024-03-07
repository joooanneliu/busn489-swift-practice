//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Joanne Liu on 2/24/24.
//

import SwiftUI

struct StopwatchView: View {
    
    @ObservedObject var managerClass = ManagerClass()
    
    var body: some View {
        Text("Hello World")
        VStack {
            Text(String(format: "%.2f", managerClass.secondElapsed))
            Button(action: {
                managerClass.start()
            }, label: {
                // gets from Apple images
                Image(systemName: "play.fill")
            })
        }
    }
}

class ManagerClass:ObservableObject {
    var secondElapsed = 0.9
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            timer in self.secondElapsed += 0.1
        }
    }
}

#Preview {
    StopwatchView()
}
