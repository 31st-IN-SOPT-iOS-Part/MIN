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
    
    private let photo = UIImageView()
    
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
        contentView.addSubviews([photo])
        
        photo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
