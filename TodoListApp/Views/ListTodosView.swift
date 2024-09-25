//
//  ListTodosView.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import SwiftUI

struct ListTodosView: View {
    
    @EnvironmentObject var listTodoViewModel: ListTodosViewModel
    
    var body: some View {
        VStack{
            if listTodoViewModel.todos.isEmpty {
                NoTodosView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listTodoViewModel.todos){ todo in
                        TodoListItem(todo: todo)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.3)){
                                    listTodoViewModel.updateTodoStatus(todo: todo)
                                }
                            }
                            .id(todo.id)
                    }
                    .onDelete(perform: listTodoViewModel.onDelete)
                    .onMove(perform: listTodoViewModel.onMove)
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .listStyle(PlainListStyle())
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddTodoView())
            }
        }
    }
}
