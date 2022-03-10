//
//  GroupModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 14.02.2022.
//

import Foundation

import UIKit
import RealmSwift



// MARK: - Welcome
struct GroupsJSON: Codable {
    let response: GroupsResponse
}

// MARK: - Response
struct GroupsResponse: Codable {
    let count: Int
    let items: [GroupModel]
}

// MARK: - Item
class GroupModel: Object, Codable, Identifiable {
    @objc dynamic var id, isClosed, isAdvertiser: Int
    //let type: TypeEnum?
    let adminLevel: Int?
    @objc dynamic var isMember: Int
    let city: City?
    @objc dynamic var photo50, photo200: String
    @objc dynamic var isAdmin: Int
    @objc dynamic var photo100: String
    @objc dynamic var name, screenName: String

    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case isAdvertiser = "is_advertiser"
        //case type
        case adminLevel = "admin_level"
        case isMember = "is_member"
        case city
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case isAdmin = "is_admin"
        case photo100 = "photo_100"
        case name = "name"
        case screenName = "screen_name"
    }
}



// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}

enum TypeEnum: String, Codable {
    case page = "page"
}
