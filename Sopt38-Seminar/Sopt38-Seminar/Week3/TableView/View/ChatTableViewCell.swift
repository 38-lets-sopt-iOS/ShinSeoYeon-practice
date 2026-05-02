import UIKit

import SnapKit
import Then

class ChatTableViewCell: UITableViewCell {
    static let identifier = "ChatTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profileImg = UIImageView().then {
        $0.image = UIImage(named: "default_profile")
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .subHead3
        $0.text = "이름"
        $0.textColor = .black
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .info
        $0.text = "위치"
        $0.textColor = .gray
    }
    
    private let messageLabel = UILabel().then {
        $0.font = .subHead5
        $0.text = "메시지"
        $0.textColor = .black
    }
    
    private let itemImg = UIImageView().then {
        $0.image = UIImage(named: "item1")
    }
    
    private func setUI() {
        addSubview(profileImg)
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(messageLabel)
        addSubview(itemImg)
    }
    
    private func setLayout() {
        profileImg.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.5)
            $0.leading.equalTo(profileImg.snp.trailing).offset(16)
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18.5)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
        }
        messageLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImg.snp.trailing).offset(16)
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
        }
        itemImg.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }
}

extension ChatTableViewCell {
    func dataBind(_ ChatData: ChatModel) {
        profileImg.image = ChatData.profileImg
        nameLabel.text = ChatData.name
        locationLabel.text = ChatData.place
        messageLabel.text = ChatData.message
        itemImg.image = ChatData.itemImg
    }
}
