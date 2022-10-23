//
//  KakaoTabbarController.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/23.
//

import UIKit

// MARK: - KakaoTabbar

class KakaoTabbar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - KakaoTabbarController

class KakaoTabbarController: UITabBarController {

    // MARK: - Properties
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    private let clientTabbar = KakaoTabbar()
    
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.setValue(clientTabbar, forKey: "tabBar")
        object_setClass(self.tabBar, KakaoTabbar.self)
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.itemPositioning = .centered
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}


// MARK: - Extensions
extension KakaoTabbarController: UITabBarControllerDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let friendViewController = FriendViewController()
        let friendNavigationController = UINavigationController(rootViewController: profileViewController)
        friendNavigationController.navigationBar.isHidden = true
        
        let viewControllers = [
            profileViewController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        let imageNames = [
            "heart"
        ]
        
        let imageSelectedNames = [
            "heart.fill"
        ]
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(systemName: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
}

