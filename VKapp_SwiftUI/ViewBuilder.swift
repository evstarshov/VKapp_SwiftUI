//
//  ViewBuilder.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI

struct ImageBuilder: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }

    var body: some View {
        content
            .resizable()
            .frame(width: 45, height: 45)
            .modifier(CircleShadow())
    }
}
