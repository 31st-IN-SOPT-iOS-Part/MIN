//
//  FriendTableViewCell.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/24.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

// MARK: - FriendTableViewCell

class FriendTableViewCell: UITableViewCell {

    // MARK: - Identifier
    
    static let identifier = "FriendTableViewCell"
    
    // MARK: - UI Components
    
    private let friendProfileImage = UIImageView()
    private let friendNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let friendMessageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11)
        $0.textColor = 0xA6A6A6.color
    }
    
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension FriendTableViewCell {
    
    // MARK: - Layout
    
    private func layout() {
        contentView.addSubviews([friendProfileImage, friendNameLabel, friendMessageLabel])
        
        friendProfileImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(44)
            make.height.equalTo(41)
        }
        
        friendNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(friendProfileImage.snp.trailing).offset(11)
        }
        
        friendMessageLabel.snp.makeConstraints { make in
            make.top.equalTo(friendNameLabel.snp.bottom).offset(1)
            make.leading.equalTo(friendNameLabel)
        }
    }
    
    // MARK: - Genral
    
    private func config() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        selectionStyle = .none
    }
    
    func dataBind(dataModel: FriendModel) {
        friendProfileImage.image = UIImage(named: dataModel.friendProfileImage)
        friendNameLabel.text = dataModel.friendName
        friendMessageLabel.text = dataModel.friendMessage
    }
}
