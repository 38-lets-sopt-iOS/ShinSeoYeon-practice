import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profile1, name: "이나연", place: "공덕", message: "내말에답장해줘", itemImg: .item1),
            ChatModel(profileImg: .profile2, name: "김수민", place: "돌곶이", message: "로봇안만듭니다", itemImg: .item2),
            ChatModel(profileImg: .profile3, name: "이상엽", place: "별내", message: "나는야경기도민", itemImg: .item3),
            ChatModel(profileImg: .profile4, name: "김경택", place: "용산", message: "저거 혹시 얼마에 파시나요?", itemImg: .item4),
            ChatModel(profileImg: .profile5, name: "김세령", place: "미국", message: "답장이 너무 늦었죠", itemImg: .item5),
            ChatModel(profileImg: .profile6, name: "정교은", place: "중국", message: "네고해주세요!!", itemImg: .item6),
            ChatModel(profileImg: .profile7, name: "이승희", place: "일본", message: "네고안됩니다", itemImg: .item7),
            ChatModel(profileImg: .profile8, name: "임성환", place: "태국", message: "네.", itemImg: .item1),
            ChatModel(profileImg: .profile9, name: "장지인", place: "명왕성", message: "나 아요 아기", itemImg: .item2),
            ChatModel(profileImg: .profile10, name: "신서연", place: "안드로메다", message: "수고하세용", itemImg: .item3),
            ChatModel(profileImg: .profile11, name: "이서영", place: "뭘보슈", message: "집에갈래", itemImg: .item4),
            ChatModel(profileImg: .profile12, name: "최주희", place: "흠", message: "얍얍", itemImg: .item1),
            ChatModel(profileImg: .profile13, name: "진소은", place: "인천", message: "안뇽", itemImg: .item2)
        ]
    }
}
