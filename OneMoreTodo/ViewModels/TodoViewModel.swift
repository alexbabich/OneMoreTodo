//
//  TodoViewModel.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

class TodoViewModel: Identifiable {
    var id: UUID
    var text: String
    var completed: Bool
    
    init(id: UUID, text: String, completed: Bool) {
        self.id = id
        self.text = text
        self.completed = completed
    }
    
    init(todo: Todo) {
        self.id = todo.id!
        self.text = todo.text!
        self.completed = todo.completed
    }
}
