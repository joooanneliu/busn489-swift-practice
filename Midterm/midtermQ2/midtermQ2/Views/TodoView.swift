//
//  TodoView.swift
//  midtermQ2
//
//  Created by Joanne Liu on 3/29/24.
//

import SwiftUI

struct TodoView: View {
    @State private var input: String = ""
    @ObservedObject var todoModel = TodoModel.shared
       
       var body: some View {
           VStack {
               ScrollView {
                   VStack() {
                       ForEach(todoModel.arr.indices, id: \.self) { index in
                           HStack {
                               Text(todoModel.arr[index])
                                   .minimumScaleFactor(0.5) // shrinks text to 50% of font size if needed
                                   .multilineTextAlignment(.leading)
                                   .frame(width: 300, height: 50)
                                   .border(.orange, width: 1)
                               
                               Button(action: {
                                   // Remove the task from the array
                                   todoModel.removeTask(at: index)
                               }) {
                                   Image(systemName: "x.circle")
                                       .foregroundColor(.black)
                               }
                               .frame(width: 50, height: 50)
                           }
                       }
                   }
                   .padding()
               }
               
            
            
            TextField("Enter task here", text: $input)
                .background(Color.white)
                .padding(12)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(10)
            
            Button(action: {
                todoModel.addTask(input)
                input = ""
            }) {
                Text("Add Task")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            
           
        }
        .padding()
    }
}

#Preview {
    TodoView()
}
