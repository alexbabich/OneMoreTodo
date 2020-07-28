//
//  GradientText.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct GradientText: ViewModifier {
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    func body(content: Content) -> some View {
        content.overlay(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
        )
        .mask(content)
    }
}

extension View {
    func gradientText(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        self.modifier(GradientText(colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
}
