//
//  ContainerView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                NavigationLink(destination: FriendsView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
        }
    }
}
