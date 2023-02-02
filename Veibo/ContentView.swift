//
//  ContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState

    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        if (appState.access_token?.count ?? 0) > 0 {
            TabView(selection: $selectedTab) {
                
                HomeContentView().tabItem {
                    Label("首页", image: selectedTab == 0 ? "tabbar_home_selected" : "tabbar_home")
                }
                .tag(0)
                
                DiscoverContentView().tabItem {
                    Image(selectedTab == 1 ? "tabbar_discover_selected" : "tabbar_discover")
                        Text("发现")
                }
                .tag(1)
                
                MessageContentView().tabItem {
                    Image(selectedTab == 2 ? "tabbar_message_center_selected" : "tabbar_message_center")
                        Text("消息")
                }
                .tag(2)
                
                ProfileContentView().tabItem {
                    Image(selectedTab == 3 ? "tabbar_profile_selected" : "tabbar_profile")
                        Text("我的")
                }
                .tag(3)
            }
            .accentColor(.orange)
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(""))) { _ in
                
            }
        } else {
            OAuthView()
        }
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}
