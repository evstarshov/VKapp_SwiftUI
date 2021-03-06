//
//  NewsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    

    private let newsService = NewsAPI()
    @Published var newsFeed: [NewsModel] = []

    
    public func fetchNews() {
        newsService.getNews { [weak self] feed in
            print("Getting news to viewmodel")
           self?.newsFeed = feed
        }
    }
}

