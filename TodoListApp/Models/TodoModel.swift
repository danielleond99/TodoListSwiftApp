//
//  TodoModel.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import Foundation

struct TodoModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateTodoStatus() -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}
