import UIKit

import SnapKit
import Then

final class LoginAPIViewController: UIViewController {
    
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()

    private var loginId: String = ""
    private var password: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }

    private func setUI() {
        view.addSubviews(
            idTextField,
            passwordTextField,
            loginButton
        )
    }

    private func setStyle() {
        view.backgroundColor = .white

        idTextField.do {
            $0.placeholder = "아이디"
            $0.borderStyle = .roundedRect
            $0.addLeftPadding()
        }

        passwordTextField.do {
            $0.placeholder = "비밀번호"
            $0.borderStyle = .roundedRect
            $0.addLeftPadding()
        }

        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
        }
    }

    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }

    private func setAddTarget() {
        idTextField.addTarget(
            self,
            action: #selector(textFieldDidEditingChanged(_:)),
            for: .editingChanged
        )

        passwordTextField.addTarget(
            self,
            action: #selector(textFieldDidEditingChanged(_:)),
            for: .editingChanged
        )

        loginButton.addTarget(
            self,
            action: #selector(loginButtonDidTap),
            for: .touchUpInside
        )
    }
}

extension LoginAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }

    @objc
    private func loginButtonDidTap() {
        Task {
            do {
                let response = try await LoginService.shared.postLogin(
                    loginId: loginId,
                    password: password
                )

                guard let userId = response.data?.userId else {
                    throw NetworkError.responseDecodingError
                }

                print("로그인 성공, userId: \(userId)")

                showAlert(
                    title: "로그인 성공",
                    message: response.message
                )
            } catch {
                showAlert(
                    title: "로그인 실패",
                    message: error.localizedDescription
                )

                print("로그인 실패", error)
            }
        }
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
