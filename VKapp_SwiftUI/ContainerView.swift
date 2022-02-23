//
//  ContainerView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @ObservedObject var shouldShowMainView = Account.shared
    
    var body: some View {
        NavigationView {
            HStack {
                VKLoginWebView()
                NavigationLink(destination: TabBarView(), isActive: $shouldShowMainView.isLoggedIn) {
                    EmptyView()
                }.foregroundColor(.white)
                    .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}
