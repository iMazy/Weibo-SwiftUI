//
//  DiscoverHotView.swift
//  Veibo
//
//  Created by Ma on 2023/1/31.
//

import SwiftUI

struct DiscoverHotView: View {
    
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
    
    var recommendItems: [String] = ["热门", "榜单", "明星", "搞笑", "情感", "周末", "春节档", "社会", "美食", "国际"]
    
    var body: some View {
        
        List {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(recommendItems, id: \.self) { title in
                        Text(title)
                            .font(.system(size: 13))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
                }
                .padding(.horizontal, 20)
            }
            .frame(height: 40)
            .listRowInsets(EdgeInsets())

            
            ForEach(0...30, id: \.self) { _ in
//                if #available(iOS 15.0, *) {
                    let randomIndex = Int.random(in: 0...9)
                Text("dasfds")
//                    MainListRowView(timeline: <#T##HomeTimelineStatus#>)
//                        .listSectionSeparator(.hidden)
//                        .listRowInsets(EdgeInsets())

//                    Color.red.padding(0)
//                } else {
//                    // Fallback on earlier versions
//                    MainListRowView(images: images)
//                }
            }
        }
        .listStyle(.plain)
        .padding(.zero)
        .padding(.horizontal, 0)
    }
}

struct DiscoverHotView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverHotView()
    }
}
