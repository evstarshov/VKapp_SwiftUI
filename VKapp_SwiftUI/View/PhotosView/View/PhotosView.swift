//
//  PhotosView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 07.03.2022.
//

import SwiftUI
import Kingfisher

struct FriendPhotoGalleryView: View {
    
    @ObservedObject var viewModel: PhotoGalleryViewModel
    
    private let colums: [GridItem] = [
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity)),
        GridItem.init(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    init(viewModel: PhotoGalleryViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical) {
            
            LazyVGrid(columns: colums, alignment: .center, spacing: 8) {
                
                ForEach(self.viewModel.photos) { photo in
                    
                    VStack(alignment: .trailing) {
                        
                        KFImage(URL(string: photo.photoUrl))
                            .cancelOnDisappear(true)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100, alignment: .center)
                        
                        LikeView(viewModel: LikeViewModel(
                            countLike: photo.likesCount,
                            isLiked2: photo.isLiked,
                            ownerId: photo.ownerID,
                            itemId: photo.id,
                            type: "photo"))
                            .background(RoundedRectangle(cornerRadius: 30,
                                                         style: .continuous)
                                            .fill(.white)
                                            .opacity(0.5)
                            )
                    }
                    
                }
                
            }
            
        }
        .navigationTitle("Photos")
        .onAppear(perform: viewModel.getPhotos)
    }
}
