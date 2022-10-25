import UIKit
import SnapKit
import Then
 
// MARK: - ProfileListViewController

class FriendViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView = UIView()
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    private let settingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "settings 1"), for: .normal)
    }
    
    private lazy var friendTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    //MARK: - Variables
    
    var friendList: [FriendModel] = [
        FriendModel(friendProfileImage: "profileImage1", friendName: "안솝트", friendMessage: "언제 볼 건데?"),
        FriendModel(friendProfileImage: "profileImage2", friendName: "최솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage3", friendName: "정솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage4", friendName: "강솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage5", friendName: "오솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage6", friendName: "황솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage7", friendName: "최솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage8", friendName: "고솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage9", friendName: "하솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage6", friendName: "황솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage7", friendName: "최솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage8", friendName: "고솝트", friendMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage9", friendName: "하솝트", friendMessage: "살려줘요"),
    ]
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        register()
        
    }
    
    // MARK: - Properties
    
    var name: String?

}

// MARK: - Extensions

extension FriendViewController {
    
    // MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView, friendTableView])
        titleView.addSubviews([friendLabel, settingButton])
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalTo(friendLabel)
        }
        
        friendTableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(50*friendList.count + 73)
        }
        
    }
    
    // MARK: - General
    
    private func config() {
        view.backgroundColor = .white

    }
    
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
        friendTableView.register(MyProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: MyProfileHeaderView.identifer)
    }
}

// MARK: - UITableViewDataSource

extension FriendViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        
        cell.dataBind(dataModel: friendList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyProfileHeaderView.identifer) as? MyProfileHeaderView else {return UIView()}
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
