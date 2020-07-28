//
//  CoreDataManager.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

final class CoreDataManager {
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var managedContext: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.managedContext = moc
    }
    
    func getTodos() -> [Todo] {
        var todos = [Todo]()
        let todoRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        do {
            todos = try self.managedContext.fetch(todoRequest)
        } catch {
            print(error)
        }
        
        return todos
    }
    
    func saveTodo(id: UUID, text: String, completed: Bool) {
        let todo = Todo(context: self.managedContext)
        todo.text = text
        todo.id = id
        todo.completed = completed
        
        do {
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func removeTodo() {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        
        fetchRequest.predicate = NSPredicate.init(format: "completed == YES")
        
        do {
            let todos = try self.managedContext.fetch(fetchRequest)
            for todo in todos {
                self.managedContext.delete(todo)
            }
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func updateTodo(id: UUID, text: String, completed: Bool) {
        let fetchRequest: NSFetchRequest<Todo> = Todo.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let todo = try self.managedContext.fetch(fetchRequest).first
            todo?.completed = completed
            todo?.text = text
            
            try self.managedContext.save()
        } catch {
            print(error)
        }
    }
}
