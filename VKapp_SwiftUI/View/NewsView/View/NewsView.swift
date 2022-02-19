//
//  NewsView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
         
        List(viewModel.newsItems) { news in
                
            NewsViewCell(newsItem: news)
                
            
        }.onAppear(perform: viewModel.fetchNews)
    }
}

