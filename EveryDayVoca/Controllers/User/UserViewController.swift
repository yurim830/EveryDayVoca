//
//  UserViewController.swift
//  EveryDayVoca
//
//  Created by 김정호 on 5/14/24.
//

import UIKit

final class UserViewController: BaseViewController {
    
    // MARK: - property
    let userView = UserView()
    
    private let titleLabel = UILabel().then {
        $0.text = "사용자 정보"
        $0.font = UIFont.pretendard(size: 17, weight: .bold)
        $0.textColor = UIColor.evText
        $0.textAlignment = .center
    }
    
    lazy var modifyButton = UIBarButtonItem().then {
        $0.title = "수정"
        $0.style = .plain
        $0.target = self
        $0.action = #selector(tappedModifyButton)
        $0.tintColor = .gray100
    }
    
    @objc func tappedModifyButton() {
        let nextView = UserModifyViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    
    
    // MARK: - life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view = self.userView
        
        self.navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.shadowImage = nil
        navigationItem.rightBarButtonItem = modifyButton
        
        bind()
    }
    
    // MARK: - method
    override func configureStyle() {
    }
    
    override func configureDelegate() {
    }
    
    override func bind() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleUserDefaultsChange(_:)), name: .userDefaultsDidChange, object: nil)
    }
    
    @objc func handleUserDefaultsChange(_ notification: Notification) {
        if let value = UserDefaultsManager.shared.getValue(key: "userName") {
            self.userView.userNameLabel.text = value
        }
        if let value = UserDefaultsManager.shared.getValue(key: "userNickName") {
            self.userView.userNickNameLabel.text = value
        }
        if let value = UserDefaultsManager.shared.getValue(key: "studyLevel") {
            self.userView.studyLevelLabel.text = value
        }
        if let value = UserDefaultsManager.shared.getValue(key: "studyAmount") {
            self.userView.studyAmountLabel.text = value
        }
        if let imageData = UserDefaults.standard.data(forKey: "profileImage"),
           let image = UIImage(data: imageData) {
            self.userView.profileImage.image = image
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .userDefaultsDidChange, object: nil)
    }

}
