//
//  ContentView.swift
//  VKapp_SwiftUI
//
//  Created by Евгений Старшов on 06.02.2022.
//

import SwiftUI
import WebKit
import Combine
import UIKit

struct VKLoginWebView: UIViewRepresentable {
    
    
    @Binding var loginComplete: Bool
    
    //fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "6704883"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "wall,friends,photos,video,stories,pages,status,notes,groups,stats"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.130")
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: VKLoginWebView
        var webViewNavigationSubscriber: AnyCancellable? = nil
        
        init(_ webView: VKLoginWebView) {
            self.parent = webView
        }
        
        deinit {
            webViewNavigationSubscriber?.cancel()
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
                }
            guard let token = params["access_token"],
                  let userId = params["user_id"] else {
                      decisionHandler(.allow)
                      return
                  }
            
            Account.shared.token = token
            Account.shared.userId = userId
            
            
            print("token = \(token)  userId = \(userId)")
            parent.loginComplete = true
            decisionHandler(.cancel)
        }
    }
}

    
    


//class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
//
//
//    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
//        guard let url = navigationResponse.response.url,
//              url.path == "/blank.html",
//              let fragment = url.fragment else {
//            decisionHandler(.allow)
//            return
//        }
//
//        let params = fragment
//            .components(separatedBy: "&")
//            .map { $0.components(separatedBy: "=") }
//            .reduce([String: String]()) { result, param in
//                var dict = result
//                let key = param[0]
//                let value = param[1]
//                dict[key] = value
//
//                return dict
//            }
//
//        guard let token = params["access_token"],
//              let userIdString = params["user_id"],
//              let _ = Int(userIdString)
//        else {
//            decisionHandler(.allow)
//            return
//        }
//
//        Account.shared.token = token
//        Account.shared.userId = userIdString
//        Account.shared.isLoggedIn = true
//
//        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
//
//        decisionHandler(.cancel)
//    }
//}
