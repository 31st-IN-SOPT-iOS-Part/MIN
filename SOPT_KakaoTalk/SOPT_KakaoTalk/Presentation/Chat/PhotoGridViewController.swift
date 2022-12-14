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
        $0.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
    }
    
    private let photoGridTitle = UILabel().then {
        $0.text = "최근 항목"
        $0.font = .systemFont(ofSize: 16)
    }
    
    private lazy var sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        
        return collectionView
    }()
    
    // MARK: - Variables
    
    var checkArray: [Bool] = [false, ]
    var itemIndexArray: [Int] = []
    var count = 0
    
    // MARK: - Constants
    
    final let photoInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let photoLineSpacing: CGFloat = 7
    final let photoInterItemSpacing: CGFloat = 9
    final let photoCellHeight: CGFloat = 119
    
    // MARK: - Objc functions
    
    @objc
    private func tapDismissButton() {
        dismissVC()
    }
    
    // MARK: - Private functions
    
    private func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        register()
        
    }
}

// MARK: - Extensions

extension PhotoGridViewController {
    
    // MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView, photoCollectionView])
        titleView.addSubviews([dismissButton, photoGridTitle, sendButton])
        
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
        
        sendButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(calculateHeight())
        }
    }
     
    // MARK: - General
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func register() {
        photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
    }
    
    private func calculateHeight() -> CGFloat {
        let count  = CGFloat(photoList.count)
        let heightCount = count/3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * photoCellHeight + (heightCount-1) * photoLineSpacing + photoInsets.top + photoInsets.bottom
    }
    
    private func customSendButton() {
        let sendText = NSAttributedString(string: "전송", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.black])
        
        if itemIndexArray.count == 0 {
            let buttonTitle = NSMutableAttributedString(attributedString: sendText)
            sendButton.setAttributedTitle(buttonTitle, for: .normal)
        } else {
            let countText = NSAttributedString(string: "\(itemIndexArray.count)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: 0xF6DD2A.color])
            let buttonTitle = NSMutableAttributedString(attributedString: countText)
            buttonTitle.append(sendText)
            sendButton.setAttributedTitle(buttonTitle, for: .normal)
        }
    } 
}

// MARK: - UICollectionViewDataSource

extension PhotoGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell()}
        
        if itemIndexArray.contains(indexPath.item) {
            let index = itemIndexArray.firstIndex(of: indexPath.item)!
            cell.setSelected(selectNumber: index)
        } else {
            cell.setDeselected()
        }

        cell.dataBind(photoModel: photoList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        
        if cell.selectNumberView.isHidden {
            itemIndexArray.append(indexPath.item)
        } else {
            itemIndexArray.remove(at: Int(cell.selectNumberLabel.text!)!-1)
        }
        
        customSendButton()
        collectionView.reloadData()
    }
}
 
// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoGridViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - photoInterItemSpacing * 2 - photoInsets.left - photoInsets.right
        return CGSize(width: doubleCellWidth/3, height: photoCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return photoLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return photoInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return photoInsets
    }
}
