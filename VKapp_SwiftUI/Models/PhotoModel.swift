//
//  PhotoModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 07.03.2022.
//

import Foundation

class PhotoModel: Codable, Identifiable {
    var id: Int
    var ownerID: Int
    var likesCount: Int = 0
    var isLiked: Int = 0
    var url: String = ""
    var assetUrl: String = ""
    
    var photoUrl: String {
        guard let size = sizes.last else { return ""}
        return size.url
    }
    
    var sizes: [PhotoSize]
    var likes: Likes? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
    }
    
}

class PhotoSize: Codable {
    var type: String = ""
    var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}

class Likes: Codable {
    var userLikes: Int = 0
    var count: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}
