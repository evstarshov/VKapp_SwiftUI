//
//  GroupsAPI.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import Foundation
import Alamofire

final class GroupsAPI {
    
    let baseURL = "https://api.vk.com/method"
    let token = Account.shared.token
    let userId = Account.shared.userId
    let version = "5.81"
    
    func getGroups(completion: @escaping([GroupModel]) -> ()) {
        let method = "/groups.get"
        let parameters: Parameters = [
            "user_id": userId,
            "extended": 1,
            "access_token": token,
            "fields": "name, photo_100",
            "count": 10,
            "v": version
        ]
        
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            guard let data = response.data else { return }
            //print(String(decoding: response.data!, as: UTF8.self))
            
            do {
                
                let GroupsJSON = try JSONDecoder().decode(GroupsJSON.self, from: data)
                let mygroups: [GroupModel] = GroupsJSON.response.items
                print("Getting groups")
                completion(mygroups)
                
            } catch {
                print(error)
            }
        }
    }
}
