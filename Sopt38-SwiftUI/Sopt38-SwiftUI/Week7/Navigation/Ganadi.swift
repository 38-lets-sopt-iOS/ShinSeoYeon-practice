//
//  Ganadi.swift
//  SwiftUI_38
//
//  Created by 신서연 on 5/23/26.
//

import SwiftUI

struct Ganadi: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let emoji: String
    let detail: String
    
    static let friends: [Ganadi] = [
        Ganadi(
            name: "가나디",
            emoji: "🐶",
            detail: "개"
        ),
        Ganadi(
            name: "고냐니",
            emoji: "🐈",
            detail: "대장, 본인 이외엔 다 부하, 강하다"
        ),
        Ganadi(
            name: "두도지",
            emoji: "🧸",
            detail: "두더지 외계인, 가나디와 친구들을 관찰중, 말할 수 있음"
        ),
        Ganadi(
            name: "공룡이",
            emoji: "🦕",
            detail: "바쁜 현대인, 사람친구가 없다, 최근 템플스테이에 관심을 가지고 있다"
        ),
        Ganadi(
            name: "햄스터",
            emoji: "🐹",
            detail: "용감하다"
        ),
        Ganadi(
            name: "와와",
            emoji: "🐕",
            detail: "성격:미침, 치와와, 수줍음이 많다"
        )
    ]
}
