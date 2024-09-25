//
//  AddTodoView.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import SwiftUI

struct AddTodoView: View {

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listTodoViewModel: ListTodosViewModel
    @State var text = ""
    
    @State var showAlert = false
    @State var alertText = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.lightGray).opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action:  addTodo, label: {
                    Text("SAVE")
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }.padding(.horizontal)
        }
        .navigationTitle("Add Todo 🖋️")
        .alert(
            "Invalid title",
            isPresented: $showAlert,
            presenting: alertText)
        { _ in }
        message: { alertText in
            Text(alertText)
        }

        
    }
    
    func addTodo() {
        if text.count >= 3{
            listTodoViewModel.addTodo(title: text)
            dismiss()
        }else{
            alertText = "Your new new todo name must be at least 3 characters long!!! 😰"
            showAlert.toggle()
        }
    }
}
