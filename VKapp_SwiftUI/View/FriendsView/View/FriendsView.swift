//
//  FriendsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 10.02.2022.
//

import SwiftUI


struct FriendsView: View {
    
    @State private var friends: [FriendModel] = [
        
        FriendModel(firstName: "Марина", lastName: "Сергеева", imageName: "marina"),
        FriendModel(firstName: "Татьяна", lastName: "Демидова", imageName: "tatiana"),
        FriendModel(firstName: "Дарина", lastName: "Кузнецова", imageName: "darina"),
        FriendModel(firstName: "Ольга", lastName: "Харитонова", imageName: "olga")
        
    ]
    
    var body: some View {
        
        List(friends.sorted(by: { $0.lastName < $1.lastName})) { friend in
            FriendViewCell(friend: friend)
        }
        .navigationBarTitle("Friends", displayMode: .inline)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
            .previewInterfaceOrientation(.portrait)
    }
}
