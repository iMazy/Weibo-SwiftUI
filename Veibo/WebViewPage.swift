//
//  WebViewPage.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI
import WebKit

///// 应用程序 ID
//let WBAppKey = "2330725072"
///// 应用程序加密信息(开发者可以申请修改)
//let WBAppSecret = "792a4d621dd18003f6e7d47f58c19fa1"
///// 回调地址 - 登录完成调转的 URL，参数以 get 形式拼接
//let WBRedirectURI = "http://baidu.com"

/// 应用程序 ID
let WBAppKey = "1857104994"
/// 应用程序加密信息(开发者可以申请修改)
let WBAppSecret = "a9bd8694b1fa5a046d379c4e2c7c3cd6"
/// 回调地址 - 登录完成调转的 URL，参数以 get 形式拼接
let WBRedirectURI = "http://www.baidu.com"

struct WebViewPage: UIViewRepresentable {

    let request: URLRequest
    var webview: WKWebView?
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        
        var parent: WebViewPage
        
        init(parent: WebViewPage) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("webView didStartProvisionalNavigation")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("webView didFinish navigation")
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            let absoluteString = navigationResponse.response.url?.absoluteString ?? ""
           print("navigationResponse absoluteString \(absoluteString)")
            
            let code = absoluteString.replacingOccurrences(of: "https://www.baidu.com" + "/?code=", with: "")
            print("navigationAction absoluteString \(absoluteString)  code:\(code)")
            
            if code.count > 0 {
                var urlString = "https://api.weibo.com/oauth2/access_token"
                
                let params = ["client_id": WBAppKey,
                              "client_secret": WBAppSecret,
                              "grant_type": "authorization_code",
                              "code": code,
                              "redirect_uri": WBRedirectURI]
                urlString += "?client_id=\(WBAppKey)&client_secret=\(WBAppSecret)&grant_type=authorization_code&code=\(code)&redirect_uri=\(WBRedirectURI)"
                NetworkManager.shared.postRequest(urlString, params: [:], type: WeiboOauth2AccessToken.self) { model in
                    print("WeiboOauth2AccessToken \(model?.access_token)")
                    if let access_token = model?.access_token, access_token.count > 0, let uid = model?.uid {
                        UserDefaults.standard.set(access_token, forKey: "access_token")
                        UserDefaults.standard.set(uid, forKey: "uid")
                    }
                }
            }
            
            if code.count > 0 {
                decisionHandler(.allow)
            } else {
                decisionHandler(.cancel)
            }
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            
//            let absoluteString: String = navigationAction.request.url?.absoluteString ?? ""
            
            decisionHandler(.allow)
            
            // print("加载请求 --- \(request.url?.absoluteString)")
            // query 就是 URL 中 `?` 后面的所有部分
            // print("加载请求 --- \(request.url?.query)")
            // 2. 从 http://baidu.com 回调地址的`查询字符串`中查找 `code=`
            //    如果有，授权成功，否则，授权失败
            
            ///http://baidu.com/?code=4d668728170f98ee04d8a792869a4792
//            let code = absoluteString.replacingOccurrences(of: WBRedirectURI + "?code=", with: "")
//            print("navigationAction absoluteString \(absoluteString)  code:\(code)")
//
//            if code.count > 0 {
//                decisionHandler(.cancel)
//            } else {
//                decisionHandler(.allow)
//            }

        }
        
        /// 加载失败
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("WKWebView, didFail navigation")
            webView.reload()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        return webview!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.uiDelegate = context.coordinator
        uiView.navigationDelegate = context.coordinator
        uiView.load(request)
    }

    func goBack() {
        webview?.goBack()
    }

    func goForward() {
        webview?.goForward()
    }

    func reload() {
        webview?.reload()
    }
}

struct WebViewPage_Previews: PreviewProvider {
  
    static var previews: some View {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WBAppKey)&redirect_uri=\(WBRedirectURI)"
        WebViewPage(request: URLRequest(url: URL(string: urlString)!), webview: WKWebView())
    }
}
