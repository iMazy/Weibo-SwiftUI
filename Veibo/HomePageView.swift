//
//  HomePageView.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI

struct HomePageView: View {
    
    var isFollowed: Bool

    var images: [String] = ["twinlake"]

    var body: some View {
        List {
            ForEach(0...30, id: \.self) { _ in
                if #available(iOS 15.0, *) {
                    let randomIndex = images.count >= 9 ? Int.random(in: 0...9) : 0
                    MainListRowView(images: images[randomPick: randomIndex])
                        .listSectionSeparator(.hidden)
                } else {
                    // Fallback on earlier versions
                    MainListRowView(images: images)
                }
            }
        }
        .padding(.zero)
        .listStyle(.plain)
        .background(Color.red)
    }
}
