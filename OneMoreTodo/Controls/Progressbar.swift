//
//  Progressbar.swift
//  OneMoreTodo
//
//  Created by alex-babich on 28.07.2020.
//  Copyright © 2020 alex-babich. All rights reserved.
//

import SwiftUI

struct Progressbar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)))
                
                Rectangle()
                    .frame(width: self.getProgressWidth(geo: geo), height: geo.size.height)
                    .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                    .animation(.linear)
            }
        }
        .cornerRadius(45)
    }
    
    private func getProgressWidth(geo: GeometryProxy) -> CGFloat {
        return min(CGFloat(self.value) * geo.size.width, geo.size.height)
    }
}

struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(value: .constant(0.5))
    }
}
