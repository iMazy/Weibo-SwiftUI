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
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
                Text("Home111")
            }
            .background(Color.red)
            .navigationBarTitle(Text("首页"), displayMode: .inline)
//            .navigationTitle("首页")
//            .listStyle(PlainListStyle())
        }
        
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
