import UIKit

import SnapKit
import Then


final class GetUsersListViewController: UIViewController {
    private var userList: [UserData] = []
    
    private let usersListTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        
        getUsersList()
    }
    
    private func setUI() {
        view.addSubview(usersListTextView)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        usersListTextView.do {
            $0.font = .systemFont(ofSize: 15)
            $0.isEditable = false
        }
    }
    
    private func setLayout() {
        usersListTextView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }
    }
    
    @objc
    private func getUsersList() {
        Task {
            do {
                let response = try await GetUsersListService.shared.getUsersList()
                userList = response
                print("유저 리스트: \(response)")
                updateUI(usersList: userList)
            } catch {
                let alert = UIAlertController(
                    title: "유저 조회 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                
                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
                print("유저 조회 실패", error)
            }
        }
    }
    
    private func updateUI(usersList: [UserData]) {
        usersListTextView.text = usersList
            .map { "id: \($0.id), 이름: \($0.name), 파트: \($0.part)" }
            .joined(separator: "\n")
    }
}
