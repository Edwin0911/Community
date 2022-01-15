//
//  Todo.swift
//  Community
//
//  Created by 龔照博 on 2021/5/11.
//

import SwiftUI

struct Todo: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Enter in a new task", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("Add New")
            })
        }
    }
    
    func addNewToDo() {
        taskStore.tasks.append( Task( id:String( taskStore.tasks.count+1), toDoItem: newToDo))
        self.newToDo = ""
    }
    
    func move( from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete( at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.toDoItem)
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }
                .navigationBarTitle("To Do List")
                .navigationBarItems(trailing: EditButton())
            }
        }
        .navigationBarHidden(true)
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}
