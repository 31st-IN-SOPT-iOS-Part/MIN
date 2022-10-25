//
//  MyProfileHeaderView.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/26.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

// MARK: - MyProfileHeaderView

class MyProfileHeaderView: UITableViewHeaderFooterView {

    // MARK: - Identifier
    
    static let identifer = "MyProfileHeaderView"
    
    // MARK: - UI Components
    
    private let myProfileImage = UIImageView().then {
        $0.image = UIImage(named: "imageFriend")
    }
    
    private let myNameLabel = UILabel().then {
        $0.text = "김솝트"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = 0x191919.color
    }
    
    private let myMessageLabel = UILabel().then {
        $0.text = "상태메세지는 여기에"
        $0.font = .systemFont(ofSize: 11)
        $0.textColor = 0xA6A6A6.color
    }
    
    private let separatorLine = UIView().then {
        $0.backgroundColor = 0xF7F7F7.color
    }
    
    // MARK: - Life Cycles
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        layout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension MyProfileHeaderView {
    
    // MARK: - Layout
    
    private func layout() {
        contentView.addSubviews([myProfileImage, myNameLabel, myMessageLabel, separatorLine])
        
        myProfileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
        
        myNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(myProfileImage.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(19)
        }
        
        myMessageLabel.snp.makeConstraints { make in
            make.leading.equalTo(myNameLabel)
            make.top.equalTo(myNameLabel.snp.bottom).offset(6)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(1)
        }
    }
    
    // MARK: - General
    
    private func config() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
    }
}
