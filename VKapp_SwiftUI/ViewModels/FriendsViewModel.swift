//
//  FriendsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class FriendsViewModel: ObservableObject {
    
    let friendService: FriendsAPI
    @Published var friends: [FriendModel] = []
    
    init(friendService: FriendsAPI) {
        self.friendService = friendService
    }
    
    public func fetchFriends() {
        friendService.getFriends { [weak self] friends in
            self?.friends = friends
        }
    }
}
