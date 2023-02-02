//
//  DiscoverContentView.swift
//  Veibo
//
//  Created by Ma on 2023/1/30.
//

import SwiftUI
import WebKit 

struct DiscoverContentView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack() {
            ZStack {
                VStack {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 32)
                                .foregroundColor(Color.black.opacity(0.05))
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                Text("搜索微博")
                            }
                            .font(Font.system(size: 12, weight: .light))
                            .foregroundColor(.gray)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "pencil.line")
                                .foregroundColor(Color.gray)
                        }
                    }
                    .padding(.horizontal)
                    
                    ZStack(alignment: .bottom) {
                        HStack(spacing: 50) {
                            
                            Button {
                                selectedTab = 0
                            } label: {
                                Text("趋势")
                                    .fontWeight(selectedTab == 0 ? .medium : .regular)
                                    .foregroundColor(selectedTab == 0 ? Color.black : Color.gray)
                            }
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.black)
                            Button {
                                selectedTab = 1
                            } label: {
                                Text("热门")
                                    .fontWeight(selectedTab == 1 ? .medium : .regular)
                                    .foregroundColor(selectedTab == 1 ? Color.black : Color.gray)
                            }
                            .font(Font.system(size: 14))
                            .foregroundColor(Color.black)
                        }
                        .offset(y: 3)
                        .frame(maxHeight: .infinity)
                        RoundedRectangle(cornerRadius: 1)
                            .frame(width: 20, height: 2)
                            .offset(x: selectedTab == 0 ? -40 : 40, y: 8)
                            .foregroundColor(.red)
                            .animation(.easeOut)
                    }
                }
            }
            .frame(height: 66)
            .frame(maxWidth: .infinity)
            .background(Color.white)

            TabView(selection: $selectedTab) {
                DiscoverTrendView().tag(0)
                DiscoverHotView().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct DiscoverContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverContentView()
    }
}
