//
//  FriendsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI


struct FriendsView: View {
    
    @ObservedObject var viewModel: FriendsViewModel
    
    let api = FriendsAPI()
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(viewModel.friends) { friend in
            FriendViewCell(friend: friend)
        }.onAppear(perform: viewModel.fetchFriends)
        .navigationBarTitle("Friends", displayMode: .inline)
    }
}

