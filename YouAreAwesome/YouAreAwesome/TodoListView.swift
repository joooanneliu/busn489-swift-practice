//
//  TodoListView.swift
//  YouAreAwesome
//
//  Created by Joanne Liu on 3/7/24.
//

import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
}

struct TodoListView: View {
    @State private var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries"),
        TodoItem(title: "Finish homework"),
        TodoItem(title: "Go for a run")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoItems) { item in
                    Text(item.title)
                }
                .onDelete(perform: deleteTodoItem)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing:
                Button(action: addTodoItem) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func addTodoItem() {
        let newItem = TodoItem(title: "New To-do")
        todoItems.append(newItem)
    }
    
    func deleteTodoItem(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}

#Preview {
    TodoListView()
}
