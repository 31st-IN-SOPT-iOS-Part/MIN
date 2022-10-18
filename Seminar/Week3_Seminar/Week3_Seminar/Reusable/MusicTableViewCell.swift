//
//  MusicTableViewCell.swift
//  Week3_Seminar
//
//  Created by 김민 on 2022/10/18.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

//MARK: - MusicTableViewCell

class MusicTableViewCell: UITableViewCell {

   //MARK: - Identifier
    
    static let identifier = "MusicTableViewCell"
    
    //MARK: - UI Components
    private let albumContainerView = UIView()
    private let albumImageView = UIImageView()
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.text = "test"
    }
    
    private let singerLabel = UILabel().then {
        $0.textColor = 0x1E1E1E.color
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.text = "test"
    }
    
    private lazy var clickableButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ClickButtonImage"), for: .normal)
        return button
    }()
    
    //MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension MusicTableViewCell {
    //MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [albumContainerView, albumImageView, titleLabel, singerLabel, clickableButton].forEach {
            contentView.addSubview($0)
        }
        
        albumContainerView.addSubview(albumImageView)
        
        albumContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(58)
        }
        
        albumImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumContainerView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(15)
        }
        
        singerLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(singerLabel.snp.bottom).offset(4)
        }
        
        clickableButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
}
