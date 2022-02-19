//
//  NewsModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import UIKit
import Foundation



// MARK: - Welcome
class NewsJSON: Codable, Identifiable {
    
    var id = UUID()
    let response: NewsResponse

    init(response: NewsResponse) {
        self.response = response
    }
}

// MARK: - Response
class NewsResponse: Codable {
    let items: [NewsItem]
    let groups: [NewsGroup]
    let profiles: [NewsProfile]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups, profiles
        case nextFrom = "next_from"
    }

    init(items: [NewsItem], groups: [NewsGroup], profiles: [NewsProfile], nextFrom: String) {
        self.items = items
        self.groups = groups
        self.profiles = profiles
        self.nextFrom = nextFrom
    }
}

// MARK: - Group
class NewsGroup: Codable {
    let id: Int?
    let photo100, photo50, photo200: String?
    let type, screenName, name: String?
    let isClosed: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }

    init(id: Int, photo100: String, photo50: String, photo200: String, type: String, screenName: String, name: String, isClosed: Int) {
        self.id = id
        self.photo100 = photo100
        self.photo50 = photo50
        self.photo200 = photo200
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

// MARK: - Item
class NewsItem: Codable, Identifiable {
    
    let id: Int = 0
    let comments: Comments?
    let canSetCategory: Bool?
    let likes: NewsLikes?
    let reposts: NewsReposts?
    let type, postType: String?
    let date, sourceID: Int?
    let text: String?
    let canDoubtCategory: Bool?
    let attachments: [Attachment]?
    let markedAsAds: Int?
    let postID: Int?
    let postSource: PostSource?
    let views: Views?

    enum CodingKeys: String, CodingKey {
        case comments
        case canSetCategory = "can_set_category"
        case likes, reposts, type
        case postType = "post_type"
        case date
        case sourceID = "source_id"
        case text
        case canDoubtCategory = "can_doubt_category"
        case attachments
        case markedAsAds = "marked_as_ads"
        case postID = "post_id"
        case postSource = "post_source"
        case views
    }

    init(comments: Comments, canSetCategory: Bool, likes: NewsLikes, reposts: NewsReposts, type: String, postType: String, date: Int, sourceID: Int, text: String, canDoubtCategory: Bool, attachments: [Attachment], markedAsAds: Int, postID: Int, postSource: PostSource, views: Views) {
        self.comments = comments
        self.canSetCategory = canSetCategory
        self.likes = likes
        self.reposts = reposts
        self.type = type
        self.postType = postType
        self.date = date
        self.sourceID = sourceID
        self.text = text
        self.canDoubtCategory = canDoubtCategory
        self.attachments = attachments
        self.markedAsAds = markedAsAds
        self.postID = postID
        self.postSource = postSource
        self.views = views
    }
}

// MARK: - Attachment
class Attachment: Codable {
    let type: String?
    let link: NewsLink?
    let photo: NewsPhoto?

    init(type: String, link: NewsLink, photo: NewsPhoto?) {
        self.type = type
        self.link = link
        self.photo = photo
    }
}

// MARK: - Link
class NewsLink: Codable {
    let title: String?
    let caption: String?
    let url: String?
    let linkDescription: String?
    let photo: NewsPhoto?

    enum CodingKeys: String, CodingKey {
        case title, caption, url
        case linkDescription = "description"
        case photo
    }

    init(title: String, caption: String, url: String, linkDescription: String, photo: NewsPhoto?) {
        self.title = title
        self.caption = caption
        self.url = url
        self.linkDescription = linkDescription
        self.photo = photo
    }
}

// MARK: - Photo
class NewsPhoto: Codable {
    let albumID, id, date: Int?
    let text: String?
    let userID: Int?
    let sizes: [Size]?
    let hasTags: Bool?
    let ownerID: Int?
    
    var photoAvailable: Size? {
        
        guard let sizes = self.sizes else { return nil }
        if let photo = sizes.first(where: {$0.type == "x"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "z"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "y"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "m"}) { return photo }
        if let photo = sizes.first(where: {$0.type == "s"}) { return photo }
        
        return sizes.first
    }

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text
        case userID = "user_id"
        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }

    init(albumID: Int, id: Int, date: Int, text: String, userID: Int, sizes: [Size],
         hasTags: Bool,
         ownerID: Int) {
        self.albumID = albumID
        self.id = id
        self.date = date
        self.text = text
        self.userID = userID
        self.sizes = sizes
        self.hasTags = hasTags
        self.ownerID = ownerID
    }
}

// MARK: - Size
class Size: Codable {
    let width, height: Int?
    let url: String?
    let type: String?

    init(width: Int, height: Int, url: String, type: String) {
        self.width = width
        self.height = height
        self.url = url
        self.type = type
    }
}

// MARK: - Comments
class Comments: Codable {
    let count, canPost: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
    }

    init(count: Int, canPost: Int) {
        self.count = count
        self.canPost = canPost
    }
}

// MARK: - Likes
class NewsLikes: Codable {
    let canLike, canPublish, count, userLikes: Int?

    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case canPublish = "can_publish"
        case count
        case userLikes = "user_likes"
    }

    init(canLike: Int, canPublish: Int, count: Int, userLikes: Int) {
        self.canLike = canLike
        self.canPublish = canPublish
        self.count = count
        self.userLikes = userLikes
    }
}

// MARK: - PostSource
class PostSource: Codable {
    let type: String?

    init(type: String) {
        self.type = type
    }
}

// MARK: - Reposts
class NewsReposts: Codable {
    let count, userReposted: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }

    init(count: Int, userReposted: Int) {
        self.count = count
        self.userReposted = userReposted
    }
}

// MARK: - Views
class Views: Codable {
    let count: Int?

    init(count: Int) {
        self.count = count
    }
}

// MARK: - Profile
class NewsProfile: Codable {
    let online, id: Int?
    let photo100: String?
    let lastName: String?
    let photo50: String?
    let onlineInfo: OnlineInfo?
    let sex: Int?
    let screenName: String?
    let firstName: String?

    enum CodingKeys: String, CodingKey {
        case online, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case onlineInfo = "online_info"
        case sex
        case screenName = "screen_name"
        case firstName = "first_name"
    }

    init(online: Int, id: Int, photo100: String, lastName: String, photo50: String, onlineInfo: OnlineInfo, sex: Int, screenName: String, firstName: String) {
        self.online = online
        self.id = id
        self.photo100 = photo100
        self.lastName = lastName
        self.photo50 = photo50
        self.onlineInfo = onlineInfo
        self.sex = sex
        self.screenName = screenName
        self.firstName = firstName
    }
}

// MARK: - OnlineInfo
class OnlineInfo: Codable {
    let visible, isMobile, isOnline: Bool?

    enum CodingKeys: String, CodingKey {
        case visible
        case isMobile = "is_mobile"
        case isOnline = "is_online"
    }

    init(visible: Bool, isMobile: Bool, isOnline: Bool) {
        self.visible = visible
        self.isMobile = isMobile
        self.isOnline = isOnline
    }
}
