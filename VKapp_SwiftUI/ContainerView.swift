//
//  ContainerView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = true
    
    var body: some View {
        NavigationView {
            HStack {
                VKLoginWebView()
                NavigationLink(destination: TabBarView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }.foregroundColor(.white)
            }
        }
    }
}
