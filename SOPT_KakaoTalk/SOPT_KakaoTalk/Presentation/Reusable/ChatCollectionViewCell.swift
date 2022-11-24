//
//  ChatCollectionViewCell.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/27.
//

import UIKit

import Kingfisher
import SnapKit
import SwiftyColor
import Then

// MARK: - ChatCollectionViewCell

class ChatCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifiers
    
    static let identifier = "ChatCollectionViewCell"
    
    // MARK: - UI Components
    
    private let profileImage = UIImageView()
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    private let messageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 11)
        $0.textColor = 0xA6A6A6.color
    }
    
    private let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 8)
        $0.textColor = 0xA6A6A6.color
    }
     
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension ChatCollectionViewCell {
    
    // MARK: - Layout
    
    private func layout() {
        
        contentView.addSubviews([profileImage, nameLabel, messageLabel, timeLabel])
        
        profileImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(44)
            make.height.equalTo(41)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(10)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    // MARK: - Confing
    
    private func config() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func dataBind(model: ChatModel) {
        nameLabel.text = model.name
        messageLabel.text = model.message
        timeLabel.text = model.time
        
        guard let url = URL(string: model.profileImage) else {return}
        profileImage.kf.setImage(with: url)
    }
}
