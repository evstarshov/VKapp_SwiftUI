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


struct AvatarTapAnimationModifier: ViewModifier {
    @State var scale: CGFloat = 1
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(self.scale)
            .animation(Animation.interpolatingSpring(
                mass: 2,
                stiffness: 50,
                damping: 100,
                initialVelocity: 12), value: scale)
        
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    self.scale = 0.3
                }
                self.scale = 1.0
            }
    }
}
