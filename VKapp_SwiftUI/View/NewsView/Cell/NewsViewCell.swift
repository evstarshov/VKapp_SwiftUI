//
//  NewsViewCell.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import SwiftUI
import Kingfisher
import QGrid

struct NewsViewCell: View {
    
    let newsItem: NewsModel
    
    var body: some View {
        
        
        VStack{
            
            HStack{
                ImageBuilder{
                    KFImage(URL(string: newsItem.avatarURL ?? ""))
                }
                Text(newsItem.creatorName ?? "name error")
                
            }
            
            Spacer()
            
            Text(newsItem.getDate()).font(.subheadline)
            
            if newsItem.photosURL?.count == 1 {
                KFImage(URL(string: newsItem.photosURL?.last ?? "")).resizable().scaledToFill()
            } else if newsItem.photosURL?.count ?? 1 > 0 {
                self.gridView()
            }
        }
        
        Text(newsItem.text).fixedSize(horizontal: false, vertical: true)
            .padding(.bottom, 5)
        
        BottomNewsView(likeCounter:
                        newsItem.likes.count,
                       viewsCounter: newsItem.views.count,
                       isLiked: newsItem.likes.userLike,
                       ownerId: newsItem.sourceID,
                       itemId: newsItem.postID)
    }
    
    private func gridView() -> some View {
        var images: [NewsImage] = []
        if let urls = newsItem.photosURL {
            for i in 0..<urls.count {
                images.append(NewsImage(nameUrl: newsItem.photosURL?[i] ?? ""))
            }
        }
        let grid = QGrid(images, columns: 3,
                         columnsInLandscape: 3,
                         vSpacing: 10.0,
                         hSpacing: 10.0,
                         vPadding: 0.0,
                         hPadding: 10.0
        ) {
            NewsImageCell(nameUrl: $0.nameUrl)
        }.scaledToFill()
        return grid
        
    }
}


struct NewsImage: Codable, Identifiable {
    var id = UUID()
    var nameUrl: String
}

struct NewsImageCell: View, Identifiable {
    
    var id = UUID()
    var nameUrl: String
    var body: some View {
        KFImage(URL(string: nameUrl)).resizable().scaledToFill()
    }
}


struct BottomNewsView: View {
    var likeCounter: Int
    var viewsCounter: Int
    var isLiked: Int
    var ownerId: Int
    var itemId: Int
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text("Просмотров: \(viewsCounter)")
            
            Spacer()
            
            LikeView(viewModel: LikeViewModel(countLike: likeCounter,
                                              isLiked2: isLiked,
                                              ownerId: ownerId,
                                              itemId: itemId,
                                              type: "post"))
        }
    }
}

struct LikeView: View {
    @ObservedObject var viewModel: LikeViewModel
    
    @State private var opacity = 1.0
    @State private var degress = 0.0
    
    private var nameHeart: String {
        self.viewModel.isLiked ? "heart.fill" : "heart"
    }
    
    var body: some View {
        HStack {
            
            Text("\(self.viewModel.countLike)")
                .rotation3DEffect(Angle(degrees: self.degress),
                                  axis: (
                                    x: CGFloat(10),
                                    y: CGFloat(0),
                                    z: CGFloat(0)))
            
            Image(systemName: self.nameHeart)
                .foregroundColor(self.viewModel.isLiked ? .red : .none)
                .opacity(self.opacity)
        }
        .padding()
        .onTapGesture {
            
            self.viewModel.toggleLike()
            self.opacity = 0.5
            withAnimation(.linear(duration: 1)) {
                self.opacity = 1
                self.degress = 360
            }
            self.degress = 0
        }
    }
}


