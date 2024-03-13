import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool = false // New property to track completion status
}

struct TodoListView: View {
    @State private var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries"),
        TodoItem(title: "Finish homework"),
        TodoItem(title: "Go for a run")
    ]
    
    @State private var newItemTitle: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todoItems.indices, id: \.self) { index in
                    HStack {
                        Button(action: {
                            self.toggleItemCompletion(index: index)
                        }) {
                            Image(systemName: self.todoItems[index].completed ? "checkmark.square" : "square")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        Text(self.todoItems[index].title)
                            .strikethrough(self.todoItems[index].completed, color: .gray)

                        Spacer()
                        
                        Button(action: {
                               self.deleteTodoItem(at: index)
                           }) {
                               Image(systemName: "trash")
                                   .foregroundColor(.red)
                           }
                           .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .onDelete(perform: deleteTodoItems)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing:
                HStack {
                    TextField("Add new item", text: $newItemTitle)
                    
                    Button(action: {
                        self.addTodoItem()
                        self.newItemTitle = ""
                    }) {
                        Image(systemName: "plus")
                    }
                }
            )
        }
    }
    
    func addTodoItem() {
        let newItem = TodoItem(title: "New To-do")
        todoItems.append(newItem)
    }
    
    func deleteTodoItem(at index: Int) {
            todoItems.remove(at: index)
        }
    
    func toggleItemCompletion(index: Int) {
        todoItems[index].completed.toggle()
    }
    
    func deleteTodoItems(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
