import UIKit

import SnapKit
import Then

final class UserInfoViewController: UIViewController {
    
    private let userId: Int
    
    private let titleLabel = UILabel()
    
    private let loginIdTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    
    private let editButton = UIButton()
    
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
            loginIdTextField,
            nameTextField,
            emailTextField,
            ageTextField,
            partTextField,
            editButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "내 정보 조회 및 수정"
            $0.font = .systemFont(ofSize: 25, weight: .semibold)
            $0.textColor = .black
        }
        
        [loginIdTextField,
         nameTextField,
         emailTextField,
         ageTextField,
         partTextField]
            .forEach {
                $0.do {
                    $0.borderStyle = .roundedRect
                    $0.font = .systemFont(ofSize: 15)
                    $0.addLeftPadding()
                    $0.backgroundColor = .white
                }
            }
        
        loginIdTextField.isEnabled = false
        partTextField.isEnabled = false
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        loginIdTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(loginIdTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
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
        loginIdTextField.text = user.loginId
        nameTextField.text = user.name
        emailTextField.text = user.email
        ageTextField.text = "\(user.age)"
        partTextField.text = user.part
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
        
        let okAction = UIAlertAction(
            title: "확인",
            style: .default
        )
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
