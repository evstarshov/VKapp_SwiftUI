//
//  FriendsImageCollectionView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI
import QGrid

//struct FriendsImageCollectionView: View {
//    
//    @ObservedObject var viewModel: FriendsViewModel
//    
//    init(viewModel: FriendsViewModel) {
//        self.viewModel = viewModel
//    }
//    
//    @State private var images = [
//    ImageItem(name: "1"),
//    ImageItem(name: "2"),
//    ImageItem(name: "3"),
//    ImageItem(name: "4"),
//    ImageItem(name: "5")
//    ]
//    
//    var body: some View {
//        QGrid(images, columns: 3) {
//            FriendImage(image: $0)
//        }.onAppear(perform: viewModel.fetchFriends)
//            .navigationBarTitle(viewModel.friend.fullName)
//    }
//}

struct FriendImage: View {
    let image: ImageItem
    var body: some View {
        Image(image.name)
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
            .padding()
    }
}


struct ImageItem: Identifiable {
   let id: UUID = UUID()
   let name: String
}
