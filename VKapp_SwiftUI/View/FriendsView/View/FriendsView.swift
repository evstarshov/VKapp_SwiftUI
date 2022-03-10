//
//  FriendsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI


struct FriendsView: View {
    
    @ObservedObject var viewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(viewModel.friends) { friend in
            NavigationLink(destination: FriendPhotoGalleryView(viewModel: PhotoGalleryViewModel(userID: friend.id)), label: { FriendViewCell(friend: friend) })
        }
        .navigationTitle("\(Tabs.friends.rawValue)")
        .onAppear { viewModel.fetchFriends()
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

