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
        let tableView = UITableView()
        
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        config()
        register()
        
    }
    
    // MARK: - Properties
    
    var name: String?
    
    
    // MARK: - Functions
    
    // MARK: - Private functions
    
    // MARK: - Objc functions

}

// MARK: - Extensions

extension FriendViewController {
    
    // MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView, friendTableView])
        titleView.addSubviews([friendLabel, settingButton])
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(52)
        }
        
        friendLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
        }
        
        settingButton.snp.makeConstraints { make in
            make.leading.equalTo(self.friendLabel.snp.trailing).offset(2)
            make.centerY.equalTo(self.friendLabel)
        }
        
        friendTableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo(50*10)
        }
        
    }
    
    // MARK: - Genral
    
    private func config() {
        view.backgroundColor = .white

    }
    
    private func register() {
        friendTableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.identifier)
    }
}

extension FriendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
