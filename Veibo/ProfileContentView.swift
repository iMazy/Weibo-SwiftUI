//
//  ProfileContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

struct ProfileContentView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 10))
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("简单不简单")
                            Text("188粉丝")
                                .font(Font.system(size: 12, weight: .light))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray.opacity(0.6))
                            .padding(.trailing, 15)
                    }
                    .background(Color.white)
                    .padding(.top, 10)
                    
                    Group {
                        ProfileRowView(imageName: "moon", title: "设置")
                    }
                    .padding(.top, 10)
                    
                    Group {
                        ProfileRowView(imageName: "moon", title: "深色模式")
                            .padding(.top, 10)
                        ProfileRowView(imageName: "star", title: "我的收藏")
                        ProfileRowView(imageName: "play.rectangle.on.rectangle", title: "稍后再看")
                        ProfileRowView(imageName: "qrcode.viewfinder", title: "扫一扫")
                        ProfileRowView(imageName: "basket", title: "草稿箱")
                        ProfileRowView(imageName: "exclamationmark.bubble.circle", title: "关注的超话")
                        ProfileRowView(imageName: "headphones.circle", title: "客服中心")
                    }
                    
                    Group {
                        ProfileRowView(imageName: "moon", title: "屏蔽设置")
                    }
                    .padding(.top, 10)
                }
                .navigationTitle("我的")
                .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color.gray.opacity(0.1))
        }
    }
    
    private var header: some View {
        Color.red
            .frame(height: 1)
    }
}


struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView()
    }
}

struct ProfileRowView: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(.leading, 15)
            
            Text(title)
                .font(Font.system(size: 15, weight: .light))
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(EdgeInsets())
        .frame(height: 44)
        .background(Color.white)
    }
}


struct ProfileRowSepratorView: View {
    
    var body: some View {
        Color.red
    }
}
