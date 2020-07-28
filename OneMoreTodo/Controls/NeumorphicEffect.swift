//
//  NeumorphicEffect.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct NeumorphicEffect: ViewModifier {
    var fillColor: Color
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(fillColor)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -2, y: -2)
        )
    }
}

extension View {
    func neumorphicEffect(fillColor: Color, cornerRadius: CGFloat) -> some View {
        self.modifier(NeumorphicEffect(fillColor: fillColor, cornerRadius: cornerRadius))
    }
}
