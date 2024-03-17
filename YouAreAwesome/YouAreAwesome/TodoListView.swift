import SwiftUI

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var completed: Bool = false // New property to track completion status
    var category:String
}

struct TodoListView: View {
    @State private var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries", category: "wtf self"),
        TodoItem(title: "Finish HW8", category: "CSCE 411"),
        TodoItem(title: "Finish Project 1", category: "CSCE411")
    ]
    
    @State private var newItemTitle: String = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(todoItems.indices, id: \.self) { index in
                    HStack {
                        // checkbox to allow users to check of to-do list items but not remove from to-do list yet
                        Button(action: {
                            self.toggleItemCompletion(index: index)
                        }) {
                            Image(systemName: self.todoItems[index].completed ? "checkmark.square" : "circle")
                                .foregroundColor(.black)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        VStack {
                            Text(self.todoItems[index].title)
                                .strikethrough(self.todoItems[index].completed, color: .gray)
                            
                            Text(self.todoItems[index].category)
                            
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            self.deleteTodoItem(at: index)
                        }) {
                            Image(systemName: "x.circle")
                                .foregroundColor(.gray)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                // onDelete allows user to swipe left to delete
                .onDelete(perform: deleteTodoItems)
                
                
                
                VStack{
                    Text("Hello")
                }
                
                
            }.navigationTitle("To-do List")
                .navigationBarItems(trailing: {
                    Button(action: {
                        // Action to perform when the plus button is tapped
                        addTodoItem()
                    }) {
                        Image(systemName: "plus")
                    }
                }())
            TodoListRowView()

        } // end of navigation stack
        
    }
    
    func addTodoItem() {
        let newItem = TodoItem(title: "New To-do", category: "")
        let taskName = TodoListRowView().getTaskName()
        print(taskName)
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
