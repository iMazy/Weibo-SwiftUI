//
//  MessagePrivateView.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI

struct MessagePrivateView: View {

    @EnvironmentObject var userNetwork: UserViewModel

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(userNetwork.users) { (user) in
                    MessagePrivateRowView(index: 1, user: user)
                        .padding(.vertical, 0)
                }
                .listRowInsets(EdgeInsets())
            }
        }
//        .edgesIgnoringSafeArea(.all)
        .background(Color.gray.opacity(0.1))
        .onAppear {
            userNetwork.getUsers()
        }
    }
}

struct MessagePrivateView_Previews: PreviewProvider {
    static var previews: some View {
        MessagePrivateView()
    }
}
