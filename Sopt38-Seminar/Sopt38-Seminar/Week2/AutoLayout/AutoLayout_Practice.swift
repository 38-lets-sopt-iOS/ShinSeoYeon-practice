import UIKit

class AutoLayout_Practice: UIViewController {
    private let yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        return yellowView
    }()
    
    private let greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        return greenView
    }()
    
    private let blackView: UIView = {
        let blackView = UIView()
        blackView.backgroundColor = .black
        return blackView
    }()
    
    private let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        return blueView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [yellowView, greenView, blackView, blueView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        let height = UIScreen.main.bounds.height / 4
        let width = UIScreen.main.bounds.width / 2
        
        NSLayoutConstraint.activate([yellowView.topAnchor.constraint(equalTo: view.topAnchor),
                                     yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     yellowView.widthAnchor.constraint(equalToConstant: width),
                                     yellowView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
                                     greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     greenView.widthAnchor.constraint(equalToConstant: width),
                                     greenView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blackView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                                     blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     blackView.widthAnchor.constraint(equalToConstant: width),
                                     blackView.heightAnchor.constraint(equalToConstant: height)])
        
        NSLayoutConstraint.activate([blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
                                     blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     blueView.widthAnchor.constraint(equalToConstant: width),
                                     blueView.heightAnchor.constraint(equalToConstant: height)])
    }
}
