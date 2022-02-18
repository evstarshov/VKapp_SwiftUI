//
//  FriendsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class FriendsViewModel: ObservableObject {
    
    let friend: FriendModel
    let friendService: FriendsAPI
    @Published var friends: [FriendModel] = []
    
    init(friend: FriendModel, friendService: FriendsAPI) {
        self.friend = friend
        self.friendService = friendService
    }
    
    public func fetchFriends() {
        friendService.getFriends { [weak self] friends in
            self?.friends = friends
        }
    }
}
