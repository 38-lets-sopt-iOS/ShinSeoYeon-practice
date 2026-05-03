import UIKit

import SnapKit

class LoginViewController_Snapkit: UIViewController {

    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x : 69, y : 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let idTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 276, width : 335, height : 52))
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "아이디"
        textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 335, width : 335, height : 52))
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호"
        textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha : 1)
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 422, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 3
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        idTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
        
    }

    private func setUI() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{self.view.addSubview($0)}
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(63)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
    }
    
    
    @objc
    private func loginButtonDidTapped() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewControllerDelegate()
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}
