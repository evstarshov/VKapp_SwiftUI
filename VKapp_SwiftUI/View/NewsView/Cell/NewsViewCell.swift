//
//  NewsViewCell.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import SwiftUI
import Kingfisher

struct NewsViewCell: View {
    
    let newsItem: NewsItem
    
    var body: some View {
        ScrollView {
        VStack {
            Text(newsItem.text ?? "error").bold()
//            KFImage(URL(string: newsItem.response.items.last?.attachments ?? ""))
            }
        }
    }
}
