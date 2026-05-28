//
//  MessageHeaderView.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct MessageHeaderView: View {
    
    let messages: [Message]
    @Binding var selectedIds: Set<UUID>
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(messages) { message in
                let isSelected = selectedIds.contains(message.id)
                
                Button {
                    if isSelected {
                        selectedIds.remove(message.id)
                    } else {
                        selectedIds.insert(message.id)
                    }
                } label: {
                    ZStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(10)
                            .foregroundStyle(isSelected ? .blue : .gray)
                        
                        Circle()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(isSelected ? .green : .gray)
                            .padding(.top, 40)
                            .padding(.leading, 30)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 10)
    }
}
