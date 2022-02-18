//
//  FriendView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI
import Kingfisher

struct FriendViewCell: View {
    
    let friend: FriendModel
    
    var body: some View {

        HStack {
            ImageBuilder{
                KFImage(URL(string: friend.photo100))
            }
            Text(friend.fullName).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
        
    }
}
