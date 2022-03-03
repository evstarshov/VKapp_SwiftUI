//
//  FriendsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class FriendsViewModel: ObservableObject {
    
    private let friendService = FriendsAPI()
    @Published var friends: [FriendModel] = []
    
    public func fetchFriends() {
        friendService.getFriends { [weak self] friends in
            self?.friends = friends
        }
    }
}
