//
//  ViewController.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import UIKit

import Moya
import SnapKit
import Then

// MARK: - MusicGridViewController

class MusicGridViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var musicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Variables
    let musicProvider = MoyaProvider<MusicRouter>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    var musicList: [MusicModel] = []
    
    // MARK: - Constants
    
    final let musicInset: UIEdgeInsets = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    final let musicLineSpacing: CGFloat = 10
    final let musicInterItemSpacing: CGFloat = 21
    final let musicCellHeight: CGFloat = 198
    
    // MARK: - Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchMusic()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        register()
    }
}

// MARK: - Extension

extension MusicGridViewController {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        view.backgroundColor = .white
        view.addSubview(musicCollectionView)
        
        musicCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    // MARK: - General Helper
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(musicList.count)
        let heightCount = count/2 + count.truncatingRemainder(dividingBy: 2)
        
        return heightCount + musicInset.top + musicInset.bottom + musicLineSpacing * (heightCount - 1)
    }
    
    private func register() {
        musicCollectionView.register(MusicGridCollectionViewCell.self, forCellWithReuseIdentifier: MusicGridCollectionViewCell.identifier)
    }
    
    // MARK: - Network Helper
    
    private func fetchMusic() {
        musicProvider.request(.fetchSongs) { response in
            switch response {
            case .success(let result):
                do {
                    let response = try result.map(FetchMusicResponseDto.self)
                    
                    for dto in response.data {
                        self.musicList.append(dto.converToMusic())
                    }
                    self.musicCollectionView.reloadData()
                } catch(let error) {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MusicGridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicGridCollectionViewCell.identifier, for: indexPath) as? MusicGridCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(musicModel: musicList[indexPath.row])
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MusicGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - musicInset.right - musicInset.left - musicInterItemSpacing
        
        return CGSize(width: doubleCellWidth/2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return musicLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return musicInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return musicInset
    }
}
