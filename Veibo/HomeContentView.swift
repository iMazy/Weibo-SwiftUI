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
    
    var body: some View {
        
        NavigationView {
            TabView {
                List {
                    ForEach(0...30, id: \.self) { _ in
                        if #available(iOS 15.0, *) {
                            let randomIndex = Int.random(in: 0...9)
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
                .navigationBarTitle(Text("首页"), displayMode: .inline)
                .background(Color.red)
                Text("recommend")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
    
        }
        
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

struct MainListRowView: View {
    
    var images: [String] = ["twinlake"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                ZStack(alignment: .bottomTrailing) {
                    Image(images.randomElement() ?? "twinlake")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    Image(systemName: "v.circle.fill")
                        .foregroundColor(.yellow)
                        .background(Circle().foregroundColor(Color.white))
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("雷军")
                    Text("48分钟前 Xiaomi 13 pro")
                        .font(.system(size: 12))
                        .foregroundColor(.gray.opacity(0.6))
                }
                Spacer()
            }
            
            Text("我也非常喜欢这款手机")
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
                
                if images.count == 1 {
                    Image(images.randomElement() ?? "")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: false)
                } else {
                    let columns = [
                        GridItem(.adaptive(minimum: 100))
                    ]
                    LazyVGrid(columns: columns) {
                        ForEach(images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
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
