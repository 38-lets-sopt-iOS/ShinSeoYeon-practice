import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .item1, name: "가나디", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "영양제", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "애플워치", price: "3000", heartIsSelected: true),
            ItemModel(itemImg: .item4, name: "가방", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .item5, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item6, name: "틴트", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .item7, name: "카메라", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .item1, name: "로션", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "락스", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "가방", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "헤드셋", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .item5, name: "틴트", price: "4000", heartIsSelected: false)
        ]
    }
}
