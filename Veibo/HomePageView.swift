//
//  HomePageView.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI

struct HomePageView: View {

    @EnvironmentObject var appState: AppState

    @State var timelines: [HomeTimelineStatus] = []
    
    var isFollowed: Bool

    var images: [String] = ["twinlake"]

    var body: some View {
        List {
            ForEach(timelines, id: \.created_at) { timeline in
//                if #available(iOS 15.0, *) {
//                    let randomIndex = images.count >= 9 ? Int.random(in: 0...9) : 0
                MainListRowView(timeline: timeline)
//                } else {
//                    // Fallback on earlier versions
//                    MainListRowView(images: images)
//                }
            }
        }
        .padding(.zero)
        .listStyle(.plain)
        .background(Color.white)
        .onAppear {
            NetworkManager.shared.getRequest("https://api.weibo.com/2/statuses/home_timeline.json?access_token=\(appState.access_token ?? "")", type: HomeTimeline.self) { model in
                print(model?.statuses ?? [])
                self.timelines = model?.statuses ?? []
            }
        }
    }
}
