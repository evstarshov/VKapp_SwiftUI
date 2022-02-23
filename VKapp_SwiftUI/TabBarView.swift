//
//  TabBarView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct TabBarView: View {
    
    
    let friendsApi = FriendsAPI()
    let groupsApi = GroupsAPI()
    let newsApi = NewsAPI()
    
    
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView(viewModel: FriendsViewModel(friendService: self.friendsApi)).tabItem {
                Text("Friends")
            }
            GroupsView(viewModel: GroupsViewModel(groupsService: self.groupsApi)).tabItem {
                Text("Groups")
            }
            NewsView(viewModel: NewsViewModel(newsService: self.newsApi)).tabItem {
                Text("News")
            }
        }
    }
}

