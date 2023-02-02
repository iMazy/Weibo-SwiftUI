//
//  HomeContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}

struct HomeContentView: View {
    
    var images: [String] = ["charleyrivers",
                            "chilkoottrail",
                            "chincoteague",
                            "hiddenlake",
                            "icybay",
                            "lakemcdonald",
                            "rainbowlake",
                            "silversalmoncreek",
                            "stmarylake",
                            "turtlerock"]
    
    @State private var selectedTab: Int = 0
    @EnvironmentObject var appState: AppState

    var body: some View {
        
        NavigationView {
            TabView(selection: $selectedTab) {
                HomePageView(isFollowed: true, images: images)
                    .tag(0)
                HomePageView(isFollowed: false, images: images)
                    .tag(1)
            }
//            .animation(.linear)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 12) {
                        Button("关注") {
                            selectedTab = 0
                        }
                        .font(Font.system(size: 17, weight: .medium))
                        .foregroundColor(Color.black.opacity(selectedTab == 0 ? 1 : 0.5))
                        Button("推荐") {
                            selectedTab = 1
                        }
                        .font(Font.system(size: 17, weight: .medium))
                        .foregroundColor(Color.black.opacity(selectedTab == 1 ? 1 : 0.5))
                    }
                }
            }
        }
        
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

struct MainListRowView: View {
    
    var timeline: HomeTimelineStatus
    
//    var images: [String] = ["twinlake"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: timeline.user.avatar_large)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }

//                    Image("twinlake")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 50, height: 50)
//                        .cornerRadius(25)
                    Image(systemName: "v.circle.fill")
                        .foregroundColor(.yellow)
                        .background(Circle().foregroundColor(Color.white))
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(timeline.user.name)
                    Text("48分钟前 Xiaomi 13 pro")
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.6))
                }
                Spacer()
            }
            
            Text(timeline.text)
                .padding(.top, 10)
            
            VStack(alignment: .leading)  {
                HStack {
                    Text("@晴天霹雳: ")
                        .font(Font.system(size: 14))
                        .foregroundColor(Color.blue)
                    +
                    Text("小米MIX 2S陶瓷白, 颜值放到现在也能打!")
                        .font(Font.system(size: 14))
                    Spacer()
                }
                
                if timeline.pic_urls.count == 1 {
                    AsyncImage(url: URL(string: timeline.pic_urls.first?.thumbnail_pic ?? ""))
//                        .resizable()
                        .scaledToFill()
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: false)
                        .clipped()
                } else {
                                        
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
                    LazyVGrid(columns: columns) {
                        ForEach(timeline.pic_urls, id: \.thumbnail_pic) { thumbnail in
                            
                            AsyncImage(url: URL(string: thumbnail.thumbnail_pic)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(10)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                            }
                            .fixedSize(horizontal: false, vertical: false)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity)
    }
}
