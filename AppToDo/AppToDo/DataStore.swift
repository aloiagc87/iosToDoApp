//
//  DataStore.swift
//  AppToDo
//
//  Created by Gregory Aloia on 4/1/22.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var toDoItem = String()
    var desc = String()
    var date = String()
    
    
    //addmore later
}

class TaskStore : ObservableObject{
    @Published var tasks = [Task]()
    
}
