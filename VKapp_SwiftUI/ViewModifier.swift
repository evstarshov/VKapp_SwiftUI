//
//  ViewModifier.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI



struct CircleShadow: ViewModifier {

    let shadowColor: Color = .black
    let shadowRadius: CGFloat = 5
    
    func body(content: Content) -> some View {
        content
            .frame(width: 45, height: 45)
            .cornerRadius(100)
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}
