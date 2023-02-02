//
//  MessagePrivateRowView.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI

struct MessagePrivateRowView: View {
    
    var index: Int
    var user: User
    
    var body: some View {
        VStack {
            if index == 0 {
                Color.clear.frame(height: 3)
            }
            HStack(spacing: 10) {
                Image("twinlake")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(user.name)
                            .font(Font.system(size: 15))
                        Spacer()
                        Text(user.phone).font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.6))
                    }
                    Text(user.company.catchPhrase)
                        .font(.system(size: 13))
                        .foregroundColor(Color.black.opacity(0.4))
                        .lineLimit(1)
                }
                
            }
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            .background(Color.white)
            if index == 0 {
                Color.clear.frame(height: 3)
            }
        }
    }
}

//struct MessagePrivateRowView_Previews: PreviewProvider {
//    static var previews: some View {
////        MessagePrivateRowView(index: 0, user: UserViewModel().users.first)
//    }
//}
