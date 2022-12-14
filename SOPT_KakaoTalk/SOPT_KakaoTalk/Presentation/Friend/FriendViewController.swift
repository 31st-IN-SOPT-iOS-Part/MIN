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
    
    private let setButton = UIButton().then {
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
        FriendModel(friendProfileImage: "profileImage1", friendName: "안솝트", friendStateMessage: "언제 볼 건데?"),
        FriendModel(friendProfileImage: "profileImage2", friendName: "최솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage3", friendName: "정솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage4", friendName: "강솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage5", friendName: "오솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage6", friendName: "황솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage7", friendName: "최솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage8", friendName: "고솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage9", friendName: "하솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage6", friendName: "황솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage7", friendName: "최솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage8", friendName: "고솝트", friendStateMessage: "살려줘요"),
        FriendModel(friendProfileImage: "profileImage9", friendName: "하솝트", friendStateMessage: "살려줘요"),
    ]
    
    var name: String?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        register()
        
    }
    
    // MARK: - Private functions
    
    private func goToProfileDetailVC() {
        let profileDetailVC = ProfileDetailViewController()
        profileDetailVC.modalPresentationStyle = .overFullScreen
        profileDetailVC.name = name
        profileDetailVC.dataBind()
        self.present(profileDetailVC, animated: true, completion: nil)
    }
    
    
    // MARK: - Objc functions
    
    @objc private func tapProfileHeaderView() {
        goToProfileDetailVC()
    }

}

// MARK: - Extensions

extension FriendViewController {
    
    // MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView, friendTableView])
        titleView.addSubviews([friendLabel, setButton])
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
        }
        
        setButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.height.equalTo(19)
            make.width.equalTo(19)
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "삭제") {_,_,_ in
            self.friendList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}

// MARK: - UITableViewDelegate

extension FriendViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyProfileHeaderView.identifer) as? MyProfileHeaderView else {return UIView()}
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapProfileHeaderView))
        headerView.addGestureRecognizer(gesture)
        
        name = headerView.myNameLabel.text
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
