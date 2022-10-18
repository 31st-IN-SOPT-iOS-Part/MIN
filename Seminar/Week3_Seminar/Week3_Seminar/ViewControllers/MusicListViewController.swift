//
//  ViewController.swift
//  Week3_Seminar
//
//  Created by 김민 on 2022/10/18.
//

import UIKit
import SnapKit
import Then

//MARK: - MusicListViewController

class MusicListViewController: UIViewController {
    
    //MARK: - UI Components
    
    private lazy var musicTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    //MARK: - LifeCycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        register()
    }


}

//MARK: - Extensions

extension MusicListViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.addSubview(musicTableView)
        
        musicTableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(70*10) //ex. 10개
        }
    }
    
    //MARK: - General Helpers
    private func config() {
        view.backgroundColor = .white
    }
    
    private func register() {
        musicTableView.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.identifier)
    }
}

extension MusicListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //ex.10개
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let musicCell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.identifier, for: indexPath) as? MusicTableViewCell else {return UITableViewCell()}
        
        return musicCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
