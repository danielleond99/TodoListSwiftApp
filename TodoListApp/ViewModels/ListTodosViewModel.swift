//
//  ListTodosViewModel.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import Foundation

class ListTodosViewModel: ObservableObject {
    
    let todoKey = "todos"
    @Published var todos: [TodoModel] = []{
        didSet{
            saveTodos()
        }
    }
    
    init() {
        getTodos()
    }
    
    func getTodos() {
        guard
            let encodedTodos = UserDefaults.standard.data(forKey: todoKey),
            let decodedTodos = try? JSONDecoder().decode([TodoModel].self, from: encodedTodos)
        else {return}
        
        todos.append(contentsOf: decodedTodos)
    }
    
    func onDelete(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    func onMove(from: IndexSet, to: Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(title: String) {
        todos.append(TodoModel(title: title))
    }
    
    func updateTodoStatus(todo: TodoModel) {
        if let index = todos.firstIndex(where:  {$0.id == todo.id}){
            todos[index] = todo.updateTodoStatus()
        }
    }
    
    func saveTodos() {
        if let encodedTodos = try? JSONEncoder().encode(todos){
            UserDefaults.standard.set(encodedTodos, forKey: todoKey)
        }
    }
}
