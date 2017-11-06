//
//  ToDoModel.swift
//  Done
//
//  Created by Mars on 11/3/17.
//  Copyright © 2017 anz-apps. All rights reserved.
//

import Foundation

struct ToDoItem {
    var id: Int = 0
    var description: String = ""
    var isUrgent = false
    var isImportant = false
    var done = false
}

class ToDoCoreModel {
    internal var coreTodos: [ToDoItem] = []

    public func add(_ description: String, urgent isUrgent: Bool=false, important isImportant: Bool=false, done isDone: Bool=false) {
        let nextId = getNextId()
        print ("\(nextId): \(description), \(isUrgent), \(isImportant)")
        coreTodos.append(ToDoItem(id: nextId, description: description, isUrgent: isUrgent, isImportant: isImportant, done: isDone))
    }

    public func update(_ changes: [AnyHashable:Any]) {
        if let todo = changes["todo"] as? ToDoItem {
            let itemIndex = getTodoIndex(todo)
            if let action = changes["action"] as? String {
                switch action {
                case "done": coreTodos[itemIndex].done = !coreTodos[itemIndex].done
                case "urgent": coreTodos[itemIndex].isUrgent = !coreTodos[itemIndex].isUrgent
                case "important": coreTodos[itemIndex].isImportant = !coreTodos[itemIndex].isImportant
                default:
                    break
                }
            }
        }
        print ("In ToDoCoreModel.update \(changes["todo"]!), \(changes["action"]!)")
    }

    private func getNextId() -> Int {
        var id = 0
        for todo in coreTodos {
            id = max(id, todo.id)
        }
        return id+1;
    }

    private func getTodoIndex(_ todo: ToDoItem) -> Int {
        for index in 0...coreTodos.count-1 {
            if coreTodos[index].id == todo.id {
                return index
            }
        }
        return -1
    }

    public func getTodo(_ id: Int) -> ToDoItem? {
        for todo in coreTodos {
            if id == todo.id {
                return todo
            }
        }
        return nil
    }

    init() {
        for index in 0...Constants.InitialToDoCount {
            let isUrgent = (arc4random_uniform(99)%2 == 1)
            let isImportant = (arc4random_uniform(99)%2 == 1)
            let isDone = (arc4random_uniform(99)%2 == 1)

            add("do something #\(index+1)", urgent: isUrgent, important: isImportant, done: isDone)
        }
    }
}
