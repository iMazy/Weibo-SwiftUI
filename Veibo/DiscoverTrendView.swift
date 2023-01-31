//
//  DiscoverTrendView.swift
//  Veibo
//
//  Created by Ma on 2023/1/31.
//

import SwiftUI

struct DiscoverTrendView: View {
    
    var topItems: [String] = ["春晚", "榜单", "同城", "超话社区"]
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    let flexibleColumns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]


    var body: some View {
        ScrollView {
            
            VStack(spacing: 0) {
                Color.gray.opacity(0.1).frame(height: 10)
                ZStack {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(topItems, id: \.self) { title in
                            VStack {
                                Image(systemName: "globe.americas.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 40, height: 40)
                                Text(title)
                                    .font(Font.system(size: 12))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    //            .frame(height: 100)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
                    .background(Color.white)
                    .offset()
                    
                }
                
                Color.gray.opacity(0.1).frame(height: 10)
                
                VStack {
                    HStack {
                        Text("热搜")
                            .foregroundColor(Color.gray)
                        Spacer()
                        Button("全部") {
                            
                        }
                    }
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    LazyVGrid(columns: flexibleColumns, spacing: 3) {
                        ForEach(0...7, id: \.self) { title in
                            HStack() {
                                Text("多地发力拼经济新春开始")
                                    .font(.system(size: 14))
                                ZStack {
                                    Color.red
                                        .frame(width: 16, height: 16)
                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                    Text("热").font(Font       .system(size:10, weight: .black))
                                        .foregroundColor(Color.white)
                                }
                                Spacer()
                            }
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal, 10)
                    .background(Color.white)
                }
                .padding(.bottom, 10)
                
                Color.gray.opacity(0.1).frame(height: 10)
                
                VStack {
                    HStack {
                        Text("热门话题")
                            .foregroundColor(Color.gray)
                        Spacer()
                        Button("全部") {
                            
                        }
                    }
                    .font(.system(size: 12))
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                    
                    LazyVGrid(columns: flexibleColumns, spacing: 3) {
                        ForEach(0...3, id: \.self) { title in
                            HStack() {
                                Image("umbagog")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(3)
                                Text("#为什么年轻人开始怀疑人生")
                                    .font(.system(size: 14))
                                Spacer()
                            }
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal, 10)
                    .background(Color.white)
                }
                .padding(.bottom, 10)
                
                ZStack(alignment: .leading) {
                    Color.gray.opacity(0.1).frame(height: 30)
                    Text("热门视频")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .offset(x: 10)
                }
                
                LazyVStack(alignment: .leading) {
                    ForEach(0...10, id: \.self) { _ in
                        ZStack {
                            Image("twinlake")
                                .resizable()
                                .frame(height: 200)
                                .scaledToFill()
                            Text("维护亲密关系")
                                .padding(5)
                                .background(Color.white)
                                .font(Font.system(size: 30))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}

struct DiscoverTrendView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverTrendView()
    }
}
