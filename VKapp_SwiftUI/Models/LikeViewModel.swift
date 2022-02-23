//
//  LikeViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 22.02.2022.
//

import SwiftUI

class LikeViewModel: ObservableObject {
    
    @Published var countLike: Int
    @Published var isLiked: Bool
    
    private var isLiked2: Int
    private var ownerId: Int
    private var itemId: Int
    private var type: String
    
    private let networkService = NewsAPI()
    
    init(countLike: Int, isLiked2: Int, ownerId: Int, itemId: Int, type: String) {
        self.countLike = countLike
        self.isLiked2 = isLiked2
        self.ownerId = ownerId
        self.itemId = itemId
        self.type = type
        
        if isLiked2 == 0 {
            self.isLiked = false
        } else {
            self.isLiked = true
        }
    }
}
