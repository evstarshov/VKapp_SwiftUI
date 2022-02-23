//
//  Account.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 18.02.2022.
//

import UIKit


final class Account: ObservableObject {
    
    private init() {}
    
    static let shared = Account()
    
    @Published var isLoggedIn: Bool = false
    @Published var userId: String = ""
    @Published var token: String = ""
    
    let clientID = "8018451"
    let version = "5.81"
}


