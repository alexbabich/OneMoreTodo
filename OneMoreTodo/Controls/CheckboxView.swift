//
//  CheckboxView.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool
    var onTap: (_ isChecked: Bool) -> Void
    
    func toggle() {
        self.isChecked.toggle()
        self.onTap(self.isChecked)
    }
    
    var body: some View {
        Button(action: toggle) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .frame(width: 30, height: 30)
            }
        }
    }
}
