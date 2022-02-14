//
//  GroupsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @State private var groups: [GroupModel] = [
        
        GroupModel(groupName: "Клуб любителей грустной жабы", groupImageName: "pepe"),
        GroupModel(groupName: "Фейковые превью Максима Каца", groupImageName: "kac")
        
    ]
    
    var body: some View {
        
        List(groups.sorted(by: { $0.groupName < $1.groupName})) { group in
            GroupsViewCell(group: group)
        }
        .navigationBarTitle("Groups", displayMode: .inline)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
            .previewInterfaceOrientation(.portrait)
    }
}
