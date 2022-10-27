//
//  ChatViewController.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/23.
//

import UIKit
import SnapKit
import Then
import SwiftyColor

// MARK: - ChatViewController

class ChatViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let chatTitleView = UIView()
    private let chattingLabel = UILabel().then {
        $0.text = "채팅"
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = .black
    }
    
    private let openChattingLabel = UILabel().then {
        $0.text = "오픈채팅"
        $0.font = .systemFont(ofSize: 22)
        $0.textColor = 0xA6A6A6.color
    }
    
    private lazy var setButton = UIButton().then {
        $0.setImage(UIImage(named: "iconSetting"), for: .normal)
    }
    
    private lazy var addButton = UIButton().then {
        $0.setImage(UIImage(named: "iconPlus"), for: .normal)
        $0.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
    }
    
    private lazy var chatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Constant
    
    final let chatHeight: CGFloat = 50
    
    // MARK: - Variables
    
    var chatList: [ChatModel] = [
        ChatModel(profileImage: "profileImage1", name: "안솝트", message: "안뇽", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage2", name: "최솝트", message: "언제 만나", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage3", name: "정솝트", message: "공부하고 있니?", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage4", name: "정솝트", message: "ㅠㅠ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage5", name: "정솝트", message: "너무 슾퍼", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage6", name: "김솝트", message: "생일 축하해", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage7", name: "이솝트", message: "ㅋㅋㅋㅋ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage8", name: "박솝트", message: "ㅋㅋ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage9", name: "윤솝트", message: "피곤해", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage1", name: "안솝트", message: "안뇽", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage2", name: "최솝트", message: "언제 만나", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage3", name: "정솝트", message: "공부하고 있니?", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage4", name: "정솝트", message: "ㅠㅠ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage5", name: "정솝트", message: "너무 슾퍼", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage6", name: "김솝트", message: "생일 축하해", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage7", name: "이솝트", message: "ㅋㅋㅋㅋ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage8", name: "박솝트", message: "ㅋㅋ", time: "오후 9:41"),
        ChatModel(profileImage: "profileImage9", name: "윤솝트", message: "피곤해", time: "오후 9:41")
    ]
    
    // MARK: - Functions
    
    private func presentToPhotoGrid() {
        let photoGridVC = PhotoGridViewController()
        photoGridVC.modalPresentationStyle = .overFullScreen
        self.present(photoGridVC, animated: true, completion: nil)
    }
    
    // MARK: - Objc functions
    
    @objc
    private func tapAddButton() {
        presentToPhotoGrid()
    }
    
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        register()
    }

}

// MARK: - Extensions

extension ChatViewController {
    
    // MARK: - Layout
    
    private func layout() {
        
        view.addSubviews([chatTitleView, chatCollectionView])
        chatTitleView.addSubviews([chattingLabel, openChattingLabel, setButton, addButton])
        
        chatTitleView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        chattingLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
        }
        
        openChattingLabel.snp.makeConstraints { make in
            make.leading.equalTo(chattingLabel.snp.trailing).offset(7)
            make.centerY.equalToSuperview()
        }
        
        setButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
        }
        
        addButton.snp.makeConstraints { make in
            make.trailing.equalTo(setButton.snp.leading).offset(-11)
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
        }
        
        chatCollectionView.snp.makeConstraints { make in
            make.top.equalTo(chatTitleView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    
    // MARK: - General
    
    private func register() {
        chatCollectionView.register(ChatCollectionViewCell.self, forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        chatCollectionView.register(ChatCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionReusableView.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as? ChatCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(model: chatList[indexPath.row])
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth, height: chatHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ChatCollectionReusableView.identifier, for: indexPath) as? ChatCollectionReusableView else {return UICollectionReusableView()}
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 80)
    }
}
