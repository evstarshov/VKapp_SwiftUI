//
//  GroupViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class GroupsViewModel: ObservableObject {
    
    
    let groupsService: GroupsAPI
    
    @Published var groups: [GroupModel] = []
    
    init(groupsService: GroupsAPI) {
        self.groupsService = groupsService
    }
    
    public func fetchGroups() {
        groupsService.getGroups { [weak self] groups in
            self?.groups = groups
        }
    }
}
