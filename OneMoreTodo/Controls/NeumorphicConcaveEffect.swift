//
//  NeumorphicConcaveEffect.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct NeumorphicConcaveEffect: ViewModifier {
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(LinearGradient(Color.bluish, Color.darkBluish))
                .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.bluish, lineWidth: 4))
                .shadow(color: Color.darkBluish, radius: 10, x: -10, y: -10)
                .shadow(color: Color.bluish, radius: 10, x: 10, y: 10)
        )
    }
}

extension View {
    func neumorphicConcaveEffect(cornerRadius: CGFloat) -> some View {
        self.modifier(NeumorphicConcaveEffect(cornerRadius: cornerRadius))
    }
}
