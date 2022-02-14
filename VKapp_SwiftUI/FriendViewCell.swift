//
//  FriendView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI


struct FriendViewCell: View {
    
    let friend: FriendModel
    
    var body: some View {

        HStack {
            ImageBuilder{ Image(friend.imageName)
            }
            Text(friend.firstName).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
            Text(friend.lastName).fixedSize(horizontal: false, vertical: true).multilineTextAlignment(.center)
        }
        
    }
}
