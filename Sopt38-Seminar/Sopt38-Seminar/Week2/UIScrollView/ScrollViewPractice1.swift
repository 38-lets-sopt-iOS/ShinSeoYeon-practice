import UIKit

import SnapKit

class ScrollViewPractice1: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let grennView = UIView()
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        grennView.backgroundColor = .green
        blueView.backgroundColor = .blue
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [grennView, blueView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        grennView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(grennView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
            $0.bottom.equalToSuperview()
        }
    }
    
    
}
