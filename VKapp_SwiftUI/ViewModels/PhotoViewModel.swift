//
//  PhotoViewModel.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 07.03.2022.
//

import Foundation


class PhotoGalleryViewModel: ObservableObject {
    
    @Published var photos: [PhotoModel] = []
    
    var userID: Int
    private let networkService = PhotoAPI()
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func getPhotos() {
        
        networkService.getPhotos(for: self.userID) { photo in
            
            self.photos = photo
            
        }
    }
}
