//
//  AddNewTodoViewModel.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import Foundation

class AddNewTodoViewModel {
    func saveTodo(todoVM: TodoViewModel) {
        CoreDataManager.shared.saveTodo(id: todoVM.id, text: todoVM.text, completed: todoVM.completed)
    }
}
