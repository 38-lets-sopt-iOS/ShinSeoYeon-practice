import UIKit

class LoginViewController: UIViewController {

    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x : 76, y : 164, width: 240, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .Pretendard.bold(ofSize: 18)
        return label
    }()
    
    private let idTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 276, width : 335, height : 52))
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "아이디"
        textField.font = .Pretendard.semiBold(ofSize: 14)
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x : 20, y : 335, width : 335, height : 52))
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호"
        textField.font = .Pretendard.semiBold(ofSize: 14)
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    private let autoLoginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 490, width: 120, height: 30))
        label.text = "자동 로그인"
        label.textColor = .black
        label.font = .Pretendard.medium(ofSize: 14)
        return label
    }()
    
    private let autoLoginSwitch: UISwitch = {
        let toggle = UISwitch(frame: CGRect(x: 300, y: 490, width: 0, height: 0))
        
        toggle.isOn = false
        toggle.onTintColor = UIColor.orange
        toggle.thumbTintColor = .white
        
        return toggle
    }()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 422, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .Pretendard.bold(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        
    }

    private func setLayout() {
        [
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            autoLoginLabel,
            autoLoginSwitch
        ].forEach { self.view.addSubview($0) }
    }
    
    @objc
    private func loginButtonDidTapped() {
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabelText(id: idTextField.text)
        
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
}

