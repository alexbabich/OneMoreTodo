//
//  DarkStyleBackground.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct DarkStyleBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 2, y: 2)
            } else {
                shape
                    .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -2, y: -2)
            }
        }
    }
}

struct DarkCircleButtonStyle: ButtonStyle {
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    var padding: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
        .contentShape(Circle())
            .background(DarkStyleBackground(isHighlighted: configuration.isPressed, shape: Circle(), colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
}

struct DarkCapsuleButtonStyle: ButtonStyle {
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    var padding: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
        .contentShape(Capsule())
            .background(DarkStyleBackground(isHighlighted: configuration.isPressed, shape: Capsule(), colors: colors, startPoint: startPoint, endPoint: endPoint))
    }
}
