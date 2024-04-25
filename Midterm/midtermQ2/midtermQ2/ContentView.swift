//
//  ContentView.swift
//  midtermQ2
//
//  Created by Joanne Liu on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodoView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("To-do")
                }
            StopwatchView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Stopwatch")
                }
            InsightView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Insight")
                }
        }
    }
}

#Preview {
    ContentView()
}
