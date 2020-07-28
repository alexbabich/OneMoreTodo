//
//  ContentView.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 0.0
    @State private var isChecked: Bool = false
    
    var body: some View {
        VStack {
            Progressbar(value: $value)
                .frame(height: 40)
            Button("add value") {
                self.value += 0.1
            }
            
            CheckboxView(isChecked: $isChecked) { checked in
                print("checkbox is checked \(self.isChecked)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
