//
//  TodoListItem.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import SwiftUI

struct TodoListItem: View {
    let todo: TodoModel
    var body: some View {
        HStack{
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
        }.font(.title2)
    }
}
