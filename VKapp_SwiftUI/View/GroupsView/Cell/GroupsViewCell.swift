//
//  GroupsViewCell.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct GroupsViewCell: View {
    
    let group: GroupModel
    
    var body: some View {
        HStack {
            ImageBuilder{ Image(group.groupImageName)
            }
            Text(group.groupName).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
    }
}
