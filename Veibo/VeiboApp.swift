//
//  VeiboApp.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

@main
struct VeiboApp: App {

    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    if let access_token = UserDefaults.standard.object(forKey: "access_token") as? String, access_token.count > 0 {
                        appState.access_token = access_token
                    } else {
                        appState.access_token = nil
                    }
                    if let uid = UserDefaults.standard.object(forKey: "uid") as? String {
                        appState.uid = uid
                    }
                }
        }
    }
}

class AppState: ObservableObject {
    @Published var access_token: String?
    @Published var uid: String?
}
