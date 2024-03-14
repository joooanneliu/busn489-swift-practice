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
        VStack{
            Text("Hello world")
            Text("WHAT")
            
            switch managerClass.mode {
            case .stopped:
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
                HStack {
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
                }
                
            }
        
            
            Text(String(format: "%.2f", managerClass.secondElapsed))
            /*
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
             */
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
        StopwatchView()
    }
}
