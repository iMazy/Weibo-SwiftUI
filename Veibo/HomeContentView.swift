//
//  HomeContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

struct HomeContentView: View {
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(0...10, id: \.self) { _ in
                    if #available(iOS 15.0, *) {
                        MainListRowView()
                            .listSectionSeparator(.hidden)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            .padding(.zero)
            .listStyle(.plain)
            .navigationBarTitle(Text("首页"), displayMode: .inline)
            .background(Color.red)
        }
        
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}

struct MainListRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                    Image(systemName: "v.circle.fill")
                        .foregroundColor(.yellow)
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
                Image("charleyrivers")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color.red)
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity)
    }
}
