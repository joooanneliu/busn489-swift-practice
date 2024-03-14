//
//  TodoListRowView.swift
//  YouAreAwesome
//
//  Created by Joanne Liu on 3/13/24.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double((hex & 0x0000FF) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

struct TodoListRowView: View {
    @State private var taskName: String = ""
        @State private var categoryName: String = ""
        
        var body: some View {
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: 0x6592CC))
                    .frame(width: 300, height: 200)
                    .overlay(
                        VStack(spacing: 16) {
                            TextField("Task", text: $taskName)
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            TextField("Category", text: $categoryName)
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                                
                            Button(action: {
                                // Action when button is tapped
                            }) {
                                Text("Done")
                                    .padding(8)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(16)
                        
                    )
            }
        }
}

struct TodoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListRowView()
    }
}

