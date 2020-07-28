//
//  AddNewTodoView.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct AddNewTodoView: View {
    @Binding var addSheetPresented: Bool
    @State private var taskText: String = ""
    
    
    var body: some View {
        
        ZStack {
            Color.bluish
            
            VStack(spacing: 20) {
                Text("Add new todo")
                    .font(.title)
                    .bold()
                    .gradientText(colors: [Color.blue, Color.darkBluish], startPoint: .top, endPoint: .bottom)
                
                TextField("Enter todo", text: $taskText)
                    .padding()
                    .neumorphicEffect(fillColor: Color.bluish, cornerRadius: 20)
                
                
                HStack {
                    Button(action: {
                        self.addSheetPresented.toggle()
                    }) {
                        HStack {
                            Image(systemName: "xmark")
                            Text("Close")
                        }
                        .foregroundColor(.white)
                    }
                    .buttonStyle(DarkCapsuleButtonStyle(colors: [Color.red, Color.pink], startPoint: .leading, endPoint: .trailing, padding: 20))
                    
                    Button(action: {
                        let vm = AddNewTodoViewModel()
                        vm.saveTodo(todoVM: TodoViewModel(id: UUID(), text: self.taskText, completed: false))
                        self.addSheetPresented.toggle()
                    }) {
                        HStack {
                            Image(systemName: "plus.rectangle.on.rectangle.fill")
                            Text("Add new")
                        }
                        .foregroundColor(.white)
                    }
                    .buttonStyle(DarkCapsuleButtonStyle(colors: [Color.darkBluish, Color.darkBluish], startPoint: .leading, endPoint: .trailing, padding: 20))
                }
                Spacer()
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
