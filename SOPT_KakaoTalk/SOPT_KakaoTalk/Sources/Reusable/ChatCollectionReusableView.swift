//
//  ChatCollectionReusableView.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/27.
//

import UIKit
import SnapKit
import Then

// MARK: - ChatCollectionReusableView

class ChatCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Identifier
    
    static let identifier = "ChatCollectionReusableView"
    
    // MARK: - UI Components
    private let adImage = UIImageView().then {
        $0.image = UIImage(named: "AdImage")
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ChatCollectionReusableView {
    
    // MARK: - Layout
    
    private func layout() {
        addSubview(adImage)
        
        adImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(71)
        }
    }
}
