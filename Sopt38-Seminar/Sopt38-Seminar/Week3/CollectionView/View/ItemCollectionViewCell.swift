import UIKit

import SnapKit
import Then

protocol ItemCollectionViewCellDeleteDelegate: AnyObject {
    func heartButtonDidTap(cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    weak var delegate: ItemCollectionViewCellDeleteDelegate?
    
    private let itemImg = UIImageView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
    }
    
    private let itemLabel = UILabel().then {
        $0.font = .pretendard(size: 16, weight: .regular)
        $0.textColor = .black
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .subHead3
        $0.textColor = .orange
    }
    
    lazy var heartIcon = UIButton().then {
        $0.setImage(UIImage(named: "heart"), for: .normal)
        $0.setImage(UIImage(named: "heartFill"), for: .selected)
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setAction()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(itemImg, itemLabel, priceLabel, heartIcon)
    }
    
    private func setLayout() {
        itemImg.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.size.equalTo(139)
        }
        
        itemLabel.snp.makeConstraints {
            $0.top.equalTo(itemImg.snp.bottom).offset(6)
            $0.leading.equalTo(itemImg.snp.leading).offset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(itemLabel.snp.bottom).offset(2)
            $0.leading.equalTo(itemLabel)
        }
        
        heartIcon.snp.makeConstraints {
            $0.bottom.equalTo(itemImg.snp.bottom).inset(8)
            $0.trailing.equalTo(itemImg.snp.trailing).inset(8)
            $0.size.equalTo(16)
        }
    }
    
    private func setAction() {
        heartIcon.addTarget(
            self,
            action: #selector(heartButtonDidTap),
            for: UIControl.Event.touchUpInside
        )
    }
    
    @objc
    private func heartButtonDidTap() {
        delegate?.heartButtonDidTap(cell: self)
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel) {
        itemImg.image = itemData.itemImg
        itemLabel.text = itemData.name
        priceLabel.text = itemData.price + "원"
        heartIcon.isSelected = itemData.heartIsSelected
    }
}
