//
//  VKapp_SwiftUIApp.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 06.02.2022.
//

import SwiftUI

@main
struct VKapp_SwiftUIApp: App {
    
    @State var loggedIn: Bool = false
    
    init() {
        configureView()
    }
    
    var body: some Scene {
        WindowGroup {
            
            if loggedIn {
                MainView()
            } else {
                VKLoginWebView(loginComplete: $loggedIn)
            }
            
        }
    }
    
    private func configureView() {
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = UIColor(.white)
        
        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
        UINavigationBar.appearance().tintColor = .black
    }
}
