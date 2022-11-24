//
//  MusicGridCollectionViewCell.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import UIKit

import SnapKit
import Then
import Kingfisher

// MARK: - MusicGridCollectionViewCell

class MusicGridCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "MusicGridCollectionViewCell"
    
    // MARK: - UI Components
    
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
    }
    
    private let singerlabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
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

// MARK: - Extension

extension MusicGridCollectionViewCell {
    
    // MARK: - Layout
    
    private func layout() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        contentView.addSubviews(albumImageView, titleLabel, singerlabel)
        
        albumImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(9)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(139)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(albumImageView.snp.bottom).offset(6)
            $0.leading.equalTo(albumImageView).offset(4)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        singerlabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
    }
    
    // MARK: - General Helper
    
    func dataBind(musicModel: MusicModel) {
        titleLabel.text = musicModel.title
        singerlabel.text = musicModel.singer
        
        guard let url = URL(string: musicModel.albumImage) else {return}
        albumImageView.kf.setImage(with: url)
    }
}
