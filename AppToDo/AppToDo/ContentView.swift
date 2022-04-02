//
//  ContentView.swift
//  AppToDo
//
//  Created by Gregory Aloia on 4/1/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    @State var newDesc : String = ""
    @State var newDate : String = ""
    
    var searchBar : some View{
        HStack{
            TextField("Enter task", text: self.$newToDo)
            TextField("details", text:
                        self.$newDesc)
            TextField("Due Date", text: self.$newDate)
            Button(action: self.addNewToDo, label: {
                Text("Add")
            })
        }
    }
    
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count+1), toDoItem: newToDo, desc: newDesc, date: newDate))
       
        self.newToDo = ""
        self.newDesc = ""
        self.newDate = ""
    }
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List{
                    ForEach(self.taskStore.tasks) {
                        task in
                        Text("Task: " + task.toDoItem)
                        Text("Details: " + task.desc)
                        Text("Due Date: " + task.date)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Tasks")
                    .navigationBarItems(trailing: EditButton())
            }
        }
    }

    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        
    }
    
    func delete(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
        
    }
}
