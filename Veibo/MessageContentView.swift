//
//  MessageContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI

struct MessageContentView: View {

    var userNetwork = UserViewModel()

    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    HStack(spacing: 0) {
                        Button("@我") {
                            selectedTab = 0
                        }
                        .frame(width: 70)
                        Button("评论") {
                            selectedTab = 1
                        }
                        .frame(width: 70)
                        Button("赞") {
                            selectedTab = 2
                        }
                        .frame(width: 70)
                        
                        ZStack(alignment: .topTrailing) {
                            Button("私信") {
                                selectedTab = 3
                            }
                            .frame(width: 70)
                            Text("1")
                                .font(Font.system(size: 10))
                                .foregroundColor(Color.white)
                                .frame(width: 12, height: 12)
                                .background(Circle().fill(Color.red))
                                .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 0))
                        }
                    }
                    .foregroundColor(.black.opacity(0.8))
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    
                    withAnimation {
                        Color.red
                            .frame(width: 16, height: 2)
                            .offset(x: -(70.0 / 2) * 3.0 + 70 * CGFloat(selectedTab))
                    }
                }
                
                TabView(selection: $selectedTab) {
                    Text("@我")
                        .tag(0)
                    Text("评论")
                        .tag(1)
                    Text("赞")
                        .tag(2)
                    MessagePrivateView().tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
//            .background(Color.gray.opacity(0.2))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("消息")
        }
        .environmentObject(userNetwork)
    }
}

struct MessageContentView_Previews: PreviewProvider {
    static var previews: some View {
        MessageContentView()
    }
}
