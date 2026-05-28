//
//  Message.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/16/26.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

extension Message {
    static let messageDummy: [Message] = [Message(name: "나연", message: "듀듀듀"),
                                          Message(name: "소은", message: "영화 보러 가자요"),
                                          Message(name: "승희", message: "버블티머글사람"),
                                          Message(name: "교은", message: "내일 점심 어때요?"),
                                          Message(name: "지인", message: "내 말 들리나요")]
}
