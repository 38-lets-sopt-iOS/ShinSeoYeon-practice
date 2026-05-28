//
//  ChatListView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct ChatListView: View {
    
    let chatLists: [ChatListModel]
    
    var body: some View {
        List(chatLists) { chatList in
            ChatView(chatList: chatList)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}
