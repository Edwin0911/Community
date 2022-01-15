//
//  ToDoStore.swift
//  Community
//
//  Created by 龔照博 on 2021/5/30.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
