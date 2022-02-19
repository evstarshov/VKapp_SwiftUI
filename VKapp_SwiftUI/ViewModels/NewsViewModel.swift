//
//  NewsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    

    let newsService: NewsAPI
    @Published var newsFeed: NewsJSON?
    @Published var nextFrom = ""
    @Published var newsItems: [NewsItem] = []
    @Published var newsGroups: [NewsGroup] = []
    @Published var newsProfiles: [NewsProfile] = []
    
    init(newsService: NewsAPI) {
        self.newsService = newsService
    }
    
    public func fetchNews() {
        newsService.getNews { feed in
            
            print("Getting news to viewmodel")
            self.newsFeed = feed!
            self.newsItems = feed!.response.items
            self.newsGroups = feed!.response.groups
            self.newsProfiles = feed!.response.profiles
            self.nextFrom = feed!.response.nextFrom
        }
    }
}


//class NewsResponseViewModel: ObservableObject {
//    
//    let news: NewsJSON
//    let newsService: NewsAPI
//    @Published var newsResponse: [NewsJSON] = []
//    
//    init(news: NewsJSON, newsService: NewsAPI) {
//        self.news = news
//        self.newsService = newsService
//    }
//    
//    public func fetchNewsResponse() {
//        newsService.getNews { [weak self] news in
//            self?.newsResponse = news
//        }
//    }
//}
