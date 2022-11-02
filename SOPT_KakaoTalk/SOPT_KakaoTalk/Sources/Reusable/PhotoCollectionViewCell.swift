//
//  PhotoCollectionViewCell.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/30.
//

import UIKit

// MARK: - PhotoCollectionViewCell

class PhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "PhotoCollectionViewCell"
    
    // MARK: - UI Components
    
    let photo = UIImageView()
    let selectNumberView = UIView().then {
        $0.backgroundColor = 0xF6DD2A.color
        $0.isHidden = true
    }

    
    let selectNumberLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
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

extension PhotoCollectionViewCell {
         
    // MARK: - Layout
        
    private func layout() {
        contentView.addSubviews([photo, selectNumberView])
        selectNumberView.addSubview(selectNumberLabel)
        
        photo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        selectNumberView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.width.equalTo(18)
            make.height.equalTo(18)
        }
        
        selectNumberLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    // MARK: - General
    
    private func config() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func dataBind(photoModel: PhotoModel) {
        photo.image = UIImage(named: photoModel.image)
    }
        
}
