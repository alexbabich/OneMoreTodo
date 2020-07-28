//
//  TodoListViewModel.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation
import SwiftUI

class TodoListViewModel: ObservableObject {
    
    @Published var todos: [TodoViewModel]
    @Published var progressValue: Float = 0.0
    
    var progressDisplayValue: String {
        return progressValue > 0.0 ? "\(Int(progressValue * 100))%" : "0%"
    }
    
    init() {
        self.todos = CoreDataManager.shared.getTodos().map(TodoViewModel.init)
    }
    
    func fetchAll() {
        self.todos = CoreDataManager.shared.getTodos().map(TodoViewModel.init)
        var completed = 0
        for todo in self.todos {
            if todo.completed == true {
                completed += 1
            }
        }
        
        if todos.count > 0 {
            progressValue = Float(completed) / Float(self.todos.count)
        } else {
            progressValue = 0.0
        }
    }
    
    func removeCompleted() {
        todos.removeAll { todo in
            todo.completed == true
        }
        
        CoreDataManager.shared.removeTodo()
        fetchAll()
    }
    
    func toggleComplete(todo: TodoViewModel) {
        CoreDataManager.shared.updateTodo(id: todo.id, text: todo.text, completed: todo.completed)
        fetchAll()
    }
}
