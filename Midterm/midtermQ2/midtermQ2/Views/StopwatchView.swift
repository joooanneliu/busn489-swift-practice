//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Joanne Liu on 3/29/24.
//

import SwiftUI

struct StopwatchView: View {
    
    @ObservedObject var managerClass = ManagerClass()
    @ObservedObject var todoModel = TodoModel.shared
    
    var body: some View {
        NavigationStack{
            VStack {
                // Access todoModel.arr here
                Text("arr here")
                ForEach(todoModel.arr.indices, id: \.self) { index in
                    Text(todoModel.arr[index])
                }
            }
            Spacer()
            
            VStack{
                Text(String(format: "%.2f", managerClass.secondElapsed))
                switch managerClass.mode {
                case .stopped:
                    // adds play button, time reset to 0.0
                    withAnimation{
                        Button(action: {
                            managerClass.start()
                        }, label: {
                            Image(systemName: "play.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(100)
                        })
                    }
                case .running:
                    // adds stop and pause button
                    HStack{
                        withAnimation{
                            Button(action: {
                                managerClass.stop()
                            }, label: {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(100)
                            })
                        }
                        withAnimation{
                            Button(action: {
                                managerClass.pause()
                            }, label: {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(100)
                            })
                        }
                    }
                case .paused:
                    // adds start and stop button
                    HStack {
                        withAnimation{
                            Button(action: {
                                managerClass.stop()
                            }, label: {
                                Image(systemName: "stop.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(100)
                            })
                        }
                        withAnimation{
                            Button(action: {managerClass.start()}, label: {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(100)
                            })
                        }
                    }
                    
                }
                
            } // end of VStack
        }
    }
}
enum mode {
    case running
    case stopped
    case paused
}

class ManagerClass:ObservableObject {
    @Published var secondElapsed = 0.0
    @Published var mode: mode = .stopped
    @Published var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            timer in self.secondElapsed += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
        secondElapsed = 0
        
        mode = .stopped
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
}

    
struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        let todoModel = TodoModel() // Create an instance of TodoModel
        return StopwatchView(todoModel: todoModel) // Pass the same instance to StopwatchView
    }
}
