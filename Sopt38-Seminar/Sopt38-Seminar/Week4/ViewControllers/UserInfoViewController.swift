import UIKit

import SnapKit
import Then

final class UserInfoViewController: UIViewController {
    private let userId: Int

    private let titleLabel = UILabel()
    private let userInfoTextView = UITextView()

    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setStyle()
        setLayout()
        getUserInfo()
    }

    private func setUI() {
        view.addSubviews(
            titleLabel,
            userInfoTextView
        )
    }

    private func setStyle() {
        view.backgroundColor = .white

        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.textColor = .black
        }

        userInfoTextView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .black
            $0.isEditable = false
            $0.layer.borderWidth = 1
            // $0.layer.borderColor = .systemGray.cgColor 에러
            $0.layer.cornerRadius = 10
            $0.textContainerInset = UIEdgeInsets(
                top: 15,
                left: 10,
                bottom: 15,
                right: 10
            )
        }
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        userInfoTextView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
    }

    private func getUserInfo() {
        Task {
            do {
                let user = try await UserService.shared.getUserInfo(userId: userId)
                updateUI(user: user)
                print("개인정보 조회 성공")
            } catch {
                showAlert(
                    title: "개인정보 조회 실패",
                    message: error.localizedDescription
                )
                print("개인정보 조회 실패", error)
            }
        }
    }

    private func updateUI(user: UserInfoData) {
        userInfoTextView.text = """
        id: \(user.id)
        아이디: \(user.loginId)
        이름: \(user.name)
        이메일: \(user.email)
        나이: \(user.age)
        파트: \(user.part)
        """
    }

    private func showAlert(
        title: String,
        message: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)

        present(alert, animated: true)
    }
}
