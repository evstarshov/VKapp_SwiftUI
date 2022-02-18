//
//  TabBarView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsView().tabItem {
                Text("Friends")
            }
            GroupsView().tabItem {
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
