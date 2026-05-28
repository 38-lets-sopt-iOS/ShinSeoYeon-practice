//
//  MessageListView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct MessageListView: View {
    
    let messages: [Message]
    @State private var selectedIds: Set<UUID> = []
    
    var body: some View {
        MessageHeaderView(messages: messages, selectedIds: $selectedIds)
        
        List(messages) { message in
            MessageView(message: message, isSelected: selectedIds.contains(message.id))
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.visible)
        }
        .listStyle(.plain)
    }
}
