//
//  GroupModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import Foundation

class GroupModel: Identifiable {
    
    let id: UUID = UUID()
    let groupName: String
    let groupImageName: String
    
    internal init(groupName: String, groupImageName: String) {
        self.groupName = groupName
        self.groupImageName = groupImageName
    }
}
