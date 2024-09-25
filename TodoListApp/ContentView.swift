//
//  ContentView.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listTodoViewModel = ListTodosViewModel()
    var body: some View {
        NavigationStack{
            ListTodosView()
        }.environmentObject(listTodoViewModel)
    }
}

#Preview {
    ContentView()
}
