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
            List {
                Section {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.vertical, 5)
                        VStack(alignment: .leading) {
                            Text("简单不简单")
                            Text("188粉丝")
                                .font(Font.system(size: 12, weight: .light))
                                .frame(height: 8)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
//                .listSectionSeparator(.hidden, edges: .all)
                Section {
                    ProfileRowView(imageName: "moon", title: "设置")
                }
          
//                .listSectionSeparator(.hidden, edges: .all)
//                Color.red.frame(height: 0)
//                ProfileRowSepratorView()
//                    .frame(height: 10)
                
                Section {
                    ProfileRowView(imageName: "moon", title: "深色模式")
                    ProfileRowView(imageName: "star", title: "我的收藏")
                    ProfileRowView(imageName: "play.rectangle.on.rectangle", title: "稍后再看")
                    ProfileRowView(imageName: "qrcode.viewfinder", title: "扫一扫")
                    ProfileRowView(imageName: "basket", title: "草稿箱")
                    ProfileRowView(imageName: "exclamationmark.bubble.circle", title: "关注的超话")
                    ProfileRowView(imageName: "headphones.circle", title: "客服中心")
                }
                
                Section {
                    ProfileRowView(imageName: "moon", title: "屏蔽设置")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("我的")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.red)
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
        HStack{
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)

            Text(title)
                .font(Font.system(size: 15, weight: .light))
                .foregroundColor(.primary)
                .offset(x: 5)
        }
    }
}


struct ProfileRowSepratorView: View {

    var body: some View {
        Color.red
    }
}
