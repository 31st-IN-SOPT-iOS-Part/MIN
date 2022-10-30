//
//  PhotoGridViewController.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/27.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

// MARK: - PhotoGridViewController

class PhotoGridViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView = UIView()
    private lazy var dismissButton = UIButton().then {
        $0.setImage(UIImage(named: "iconClose"), for: .normal)
    }
    
    private let photoGridTitle = UILabel().then {
        $0.text = "최근 항목"
        $0.font = .systemFont(ofSize: 16)
    }
    
    private lazy var sendbutton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        
    }
}

// MARK: - Extensions
extension PhotoGridViewController {
    
    // MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView])
        titleView.addSubviews([dismissButton, photoGridTitle, sendbutton])
        
        titleView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(38)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        photoGridTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        sendbutton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Config
    
    private func config() {
        view.backgroundColor = .white
    }
}
