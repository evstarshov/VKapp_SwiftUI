//
//  TabBarView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct TabBarView: View {
    
    let friend = FriendModel()
    let friendsApi = FriendsAPI()
    let group = GroupModel()
    let groupsApi = GroupsAPI()
    
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView(viewModel: FriendsViewModel(friend: friend, friendService: self.friendsApi)).tabItem {
                Text("Friends")
            }
            GroupsView(viewModel: GroupsViewModel(group: group, groupsService: groupsApi)).tabItem {
                Text("Groups")
            }
            NewsView().tabItem {
                Text("News")
            }
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
