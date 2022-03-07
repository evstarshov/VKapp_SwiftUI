//
//  ContainerView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

enum Tabs: String {
    
    case friends = "Friends"
    case groups = "Groups"
    case news = "News"
}


struct MainView: View {
    
    private var friendsViewModel = FriendsViewModel()
    private var groupsViewModel = GroupsViewModel()
    private var newsViewModel = NewsViewModel()
    
    
    var body: some View {
        
        
        
        MainTabBar(friendViewModel:self.friendsViewModel,
                   groupsViewModel: self.groupsViewModel,
                   newsViewModel: self.newsViewModel)
            .navigationBarBackButtonHidden(false)
            .onAppear { print("Logged IN") }
            .ignoresSafeArea()
    }

}
