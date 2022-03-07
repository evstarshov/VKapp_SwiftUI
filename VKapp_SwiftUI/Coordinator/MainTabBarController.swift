//
//  MainTabBarController.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 03.03.2022.
//

import Foundation
import SwiftUI

struct MainTabBar: UIViewControllerRepresentable {
    
    var friendViewModel: FriendsViewModel
    var groupsViewModel: GroupsViewModel
    var newsViewModel: NewsViewModel
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UITabBarController()
        let controllers = setControllers()
        controller.viewControllers = controllers
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
        let controllers = setControllers()
        uiViewController.tabBarController?.setViewControllers(controllers, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        var mainTabBar: MainTabBar
        
        init(_ tabBarController: MainTabBar) {
            mainTabBar = tabBarController
        }
    }
    
    func setControllers() -> [UIViewController] {
        
        let friendsView = NavigationView {
            FriendsView(viewModel: self.friendViewModel)
        }
        let friendsVC = UIHostingController(rootView: friendsView)
        let friendsTabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2.fill"), tag: 0)
        friendsVC.tabBarItem = friendsTabBarItem
        
        let groupsView = NavigationView {
            GroupsView(viewModel: self.groupsViewModel)
        }
        let groupsVC = UIHostingController(rootView: groupsView)
        let groupsTabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3.fill"), tag: 1)
        groupsVC.tabBarItem = groupsTabBarItem
        
        let newsView = NavigationView {
            NewsView(viewModel: self.newsViewModel)
        }
        let newsVC = UIHostingController(rootView: newsView)
        let newsTabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper.fill"), tag: 2)
        newsVC.tabBarItem = newsTabBarItem
        
        let controllers = [friendsVC, groupsVC, newsVC]
        
        return controllers
    }
    
}
