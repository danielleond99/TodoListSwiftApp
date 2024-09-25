//
//  NoTodosView.swift
//  TodoListApp
//
//  Created by Daniel Leon on 25/9/24.
//

import SwiftUI

struct NoTodosView: View {
    
    @State var isAnimated = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Are you a productive person? I think you should click the add button and a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddTodoView(), label: {
                    Text("Add something 🥳")
                        .foregroundStyle(Color(.white))
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(isAnimated ? secondaryAccentColor : Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.horizontal, isAnimated ? 30 : 50)
                .shadow(
                    color: isAnimated ? secondaryAccentColor.opacity(0.3) : Color.accentColor.opacity(0.7),
                    radius: isAnimated ? 20: 10,
                    y: isAnimated ? 50: 30)
                .scaleEffect(isAnimated ? 1.1 : 1.0)
                .offset(y: isAnimated ? -10 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: onAppear)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func onAppear() {
        if !isAnimated {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.easeInOut(duration: 2).repeatForever()){
                    isAnimated.toggle()
                }
            }
        }
    }
}
