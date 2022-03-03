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
         
        List(viewModel.newsFeed) { news in
                
            NewsViewCell(newsItem: news)
                
            
        }
        .navigationTitle("\(Tabs.news.rawValue)")
        .onAppear {
            viewModel.fetchNews()
            UITableView.appearance().backgroundColor = .clear
        }
    }
}

