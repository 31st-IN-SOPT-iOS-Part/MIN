//
//  MusicGridViewController.swift
//  Week3_Seminar
//
//  Created by 김민 on 2022/10/19.
//

import UIKit
import SnapKit

//MARK: - MusicGridViewController

class MusicGridViewController: UIViewController {
    
    //MARK: - UI Components
    
    private lazy var musicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - Variables
    
    var musicList: [MusicModel] = [
            MusicModel(albumImage: "albumImage1", title: "Eleven", singer: "IVE(아이브)"),
            MusicModel(albumImage: "albumImage2", title: "After LIKE", singer: "IVE(아이브)"),
            MusicModel(albumImage: "albumImage3", title: "Attention", singer: "New Jeans"),
            MusicModel(albumImage: "albumImage4", title: "Shut Down", singer: "BLACKPINK"),
            MusicModel(albumImage: "albumImage5", title: "Hype Boy", singer: "New Jeans"),
            MusicModel(albumImage: "albumImage6", title: "LOVE DIVE", singer: "IVE(아이브)"),
            MusicModel(albumImage: "albumImage7", title: "Pink Venom", singer: "BLACKPINK"),
            MusicModel(albumImage: "albumImage8", title: "Rush Hour (feat. j-hope of ...", singer: "Crush"),
            MusicModel(albumImage: "albumImage9", title: "Monologue", singer: "테이")
        ]
    
    //MARK: - Constant
    
    final let kMusicInset: UIEdgeInsets = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    final let kMusicLineSpacing: CGFloat = 10
    final let kMusicInterItemSpacing: CGFloat = 21
    final let kCellHeight: CGFloat = 198


    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        layout()
        config()
        register()
    }
}

//MARK: - Extensions

extension MusicGridViewController {
    //MARK: - Layout Helpers
    
    private func layout() {
        view.addSubview(musicCollectionView)
        
        musicCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(calculateCellHeight())
        }
    }
    
    //MARK: - General Helpers
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(musicList.count)
        let heightCount = count/2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * kCellHeight + (heightCount - 1) * kMusicLineSpacing + kMusicInset.top + kMusicInset.bottom
    }
    
    private func register() {
        musicCollectionView.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: MusicCollectionViewCell.identifier)
    }
}

extension MusicGridViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let musicCell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath) as? MusicCollectionViewCell else {return UICollectionViewCell()}
        
        musicCell.dataBind(model: musicList[indexPath.row])
        return musicCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - kMusicInset.left - kMusicInset.right - kMusicInterItemSpacing
        
        return CGSize(width: doubleCellWidth/2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kMusicLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kMusicInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return kMusicInset
    }
}
