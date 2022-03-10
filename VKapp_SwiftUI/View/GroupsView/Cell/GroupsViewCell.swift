//
//  GroupsViewCell.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI
import Kingfisher

struct GroupsViewCell: View {
    
    let group: GroupModel
    
    var body: some View {
        HStack {
            ImageBuilder{ KFImage(URL(string: group.photo100))
            }
            Text(group.name).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
    }
}
