//
//  ToDoViewModel.swift
//  Done
//
//  Created by Mars on 11/4/17.
//  Copyright © 2017 anz-apps. All rights reserved.
//

import Foundation

class ToDoViewModel : ToDoCoreModel {

    enum listDisplayType {
        case eisenhower
        case alphabetical
        case dueDate
    }

    var displayStyle = listDisplayType.eisenhower
    var todos: [[Int]] = []
    var sectionHeaders = [String]()

    func sort() {
        todos = [];
        switch displayStyle {
        case .eisenhower:
            for _ in 0...3 {
                todos.append([])
            }
            for item in coreTodos {
                if item.isUrgent && item.isImportant {
                    todos[0].append(item.id)
                } else if item.isUrgent && !item.isImportant {
                    todos[1].append(item.id)
                } else if !item.isUrgent && item.isImportant {
                    todos[2].append(item.id)
                } else {
                    todos[3].append(item.id)
                }
            }
            sectionHeaders = ["Urgent & Important", "Urgent, but not important", "Not urgent, but important", "Neither urgent nor important"]
        default: break
        }
    }
    override init() {
        super.init()
        sort()
    }
}
