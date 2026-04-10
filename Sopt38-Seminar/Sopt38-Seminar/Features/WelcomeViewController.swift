import UIKit

class WelcomeViewController: UIViewController {
    
    private var id: String? = ""
    
    func configure(id: String?) {
        self.id = id
    }
    
    private let logoImage : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        image.image = UIImage(named: "titleImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let welcomeLabel : UILabel = {
        let label = UILabel(frame: CGRect(x : 95, y : 295, width: 180, height: 60))
        label.textColor = .black
        label.text = "??님\n반가워요!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var mainButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 420, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 3
        return button
    }()
    
    private lazy var backLoginButton : UIButton = {
        let button = UIButton(frame : CGRect(x: 20, y: 490, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        setLayout()
    }
    
    private func setLayout() {
        [logoImage, welcomeLabel, mainButton, backLoginButton].forEach{self.view.addSubview($0)}
    }
    

    @objc
    private func backToLoginButtonDidTap(){
        if (self.navigationController == nil){
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func setLabelText(id: String?){
        self.id = id
        welcomeLabel.text = "\(id)님\n반가워요!"
    }
}

