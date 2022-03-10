//
//  PhotoAPI.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 07.03.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

final class PhotoAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Account.shared.token
    let userId = Account.shared.userId
    let version = "5.81"

    
    func getPhotos(for id: Int?, completion: @escaping([PhotoModel])->()) {
        
        guard let userID = id else { return }
        
        let method = "/photos.getAll"
        
        let parameters: Parameters = [
            "owner_id": userID,
            "extended": 1,
            "count": 10,
            "no_service_albums": 0,
            "access_token": token,
            "v": version
        ]
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            
            guard let data = response.data else { return }
        
            print(String(decoding: response.data!, as: UTF8.self))
            
            do {
                let itemsData = try JSON(data)["response"]["items"].rawData()
                
                
                var photos = try JSONDecoder().decode([PhotoModel].self, from: itemsData)
                
                for photo in photos {
                    photo.assetUrl = photo.photoUrl
                }
                
                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}
