//
//  FriendModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import Foundation


class FriendModel: Identifiable {
    internal init(firstName: String, lastName: String, imageName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.imageName = imageName
    }
    
    let id: UUID = UUID()
    let firstName: String
    let lastName: String
    let imageName: String
}
