//
//  OAuthView.swift
//  Veibo
//
//  Created by Ma on 2023/2/2.
//

import SwiftUI
import WebKit

struct OAuthView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        Button("微博授权") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAppKey)&redirect_uri=\(WBRedirectURI)"
            WebViewPage(request: URLRequest(url: URL(string: urlString)!), webview: WKWebView())
        }
    }
}

struct OAuthView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthView()
    }
}
