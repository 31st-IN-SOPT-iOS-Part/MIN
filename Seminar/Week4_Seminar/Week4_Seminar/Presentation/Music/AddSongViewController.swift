//
//  AddSongViewController.swift
//  INSOPT_SEMINAR
//
//  Created by hansol on 2022/11/18.
//

import UIKit

import Moya
import SnapKit
import Then

// MARK: - AddSongViewController

final class AddSongViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let albumImageView = UIImageView().then {
        $0.image = UIImage(systemName: "heart.fill")
    
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "하트"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private let singerLabel = UILabel().then {
        $0.text = "밍"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    private lazy var addButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.setTitle("추가", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.addTarget(self, action: #selector(touchupAddButton), for: .touchUpInside)
    }
    
    // MARK: - Variables
    
    let musicRouter = MoyaProvider<MusicRouter>(
        plugins: [NetworkLoggerPlugin(verbose: true)]
    )
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

// MARK: - Extensions

extension AddSongViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [albumImageView, titleLabel, singerLabel, addButton].forEach {
            view.addSubview($0)
        }
        
        albumImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(albumImageView.snp.bottom).offset(10)
            $0.leading.equalTo(albumImageView)
        }
        
        singerLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(albumImageView)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(singerLabel.snp.bottom).offset(20.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
    }
    
    // MARK: - Action Helpers
    
    @objc
    private func touchupAddButton() {
        guard let image = albumImageView.image else { return }
        let data = image.jpegData(compressionQuality: 1.0)
        if let data = data,
           let singer = singerLabel.text,
           let title = titleLabel.text {
            let param = AddSongRequestDto(image: data, title: title, singer: singer)
            addSong(param: param)
        }
    }
    
    // MARK: - Server Helpers
    
    private func addSong(param: AddSongRequestDto) {
        musicRouter.request(.addSong(param: param)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                if status >= 200 && status < 300 {
                   print("success")
                }
                if status >= 400 {
                    print("error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
