//
//  NewsViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    
    let item: NewsItem
    let profile: NewsProfile
    let group: NewsGroup
    let newsService: NewsAPI
    
    @Published var newsItems: [NewsItem] = []
    @Published var newsGroups: [NewsGroup] = []
    @Published var newsProfiles: [NewsProfile] = []
    
    init(item: NewsItem, group: NewsGroup, profile: NewsProfile, newsService: NewsAPI) {
        self.newsService = newsService
        self.profile = profile
        self.group = group
        self.item = item
    }
    
    public func fetchNews() {
        newsService.getNews { [weak self] news in
            self?.newsItems = news!.response.items
            self?.newsGroups = news!.response.groups
            self?.newsProfiles = news!.response.profiles
        }
    }
}
