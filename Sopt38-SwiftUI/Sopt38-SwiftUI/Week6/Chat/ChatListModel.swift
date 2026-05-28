//
//  ChatListModel.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import Foundation
import SwiftUI

struct ChatListModel: Identifiable {
    let id = UUID()
    let profileImage: ImageResource
    let name: String
    let location: String
    let lastMessage: String
    let productImage: ImageResource
}

extension ChatListModel {
    static let chatDummy: [ChatListModel] = [
        ChatListModel(profileImage: .profile1, name: "이나연", location: "공덕", lastMessage: "내말에답장해줘", productImage: .product1),
        ChatListModel(profileImage: .profile2, name: "김수민", location: "돌곶이", lastMessage: "로봇안만듭니다", productImage: .product2),
        ChatListModel(profileImage: .profile3, name: "이상엽", location: "별내", lastMessage: "나는야경기도민", productImage: .product3),
        ChatListModel(profileImage: .profile4, name: "김경택", location: "용산", lastMessage: "저거 혹시 얼마에 파시나요?", productImage: .product4),
        ChatListModel(profileImage: .profile5, name: "김세령", location: "미국", lastMessage: "답장이 너무 늦었죠", productImage: .product5),
        ChatListModel(profileImage: .profile1, name: "정교은", location: "중국", lastMessage: "네고해주세요!!", productImage: .product1),
        ChatListModel(profileImage: .profile2, name: "이승희", location: "일본", lastMessage: "네고안됩니다", productImage: .product2),
        ChatListModel(profileImage: .profile3, name: "임성환", location: "태국", lastMessage: "네.", productImage: .product3),
        ChatListModel(profileImage: .profile4, name: "장지인", location: "명왕성", lastMessage: "나 아요 아기", productImage: .product4),
        ChatListModel(profileImage: .profile5, name: "신서연", location: "안드로메다", lastMessage: "수고하세용", productImage: .product5),
        ChatListModel(profileImage: .profile1, name: "이서영", location: "뭘보슈", lastMessage: "집에갈래", productImage: .product1),
        ChatListModel(profileImage: .profile2, name: "최주희", location: "하암", lastMessage: "헐", productImage: .product2)
    ]
}
