//
//  MusicCollectionViewCell.swift
//  Week3_Seminar
//
//  Created by 김민 on 2022/10/19.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

//MARK: - MusicCOlelctionViewCell

class MusicCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "MusicCollectionViewCell"
    
    // MARK: - UI Components
    
    private let albumContainerView = UIView()
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let singerLabel = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    //MARK: - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MusicCollectionViewCell {
    
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [albumContainerView, titleLabel, singerLabel].forEach {
            contentView.addSubview($0)
        }
        
        albumContainerView.addSubview(albumImageView)
        
        albumContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(139)
        }
        
        albumImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(albumContainerView.snp.bottom).offset(6)
            make.leading.equalTo(albumContainerView).offset(4)
            make.trailing.equalToSuperview().offset(-9)
        }
        
        singerLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: MusicModel) {
        albumImageView.image = UIImage(named: model.albumImage)
        titleLabel.text = model.title
        singerLabel.text = model.singer
    }
    
}
