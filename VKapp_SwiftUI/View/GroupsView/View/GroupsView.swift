//
//  GroupsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(viewModel.groups) { group in
            GroupsViewCell(group: group)
        }.onAppear(perform: viewModel.fetchGroups)
            
            .navigationTitle("Groups")
    }
}


