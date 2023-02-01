//
//  MessagePrivateView.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI

struct MessagePrivateView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0...20, id: \.self) { index in
                    MessagePrivateRowView(index: index)
                        .padding(.vertical, 0)
                }
                .listRowInsets(EdgeInsets())
            }
        }
//        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.1))
    }
}

struct MessagePrivateView_Previews: PreviewProvider {
    static var previews: some View {
        MessagePrivateView()
    }
}
