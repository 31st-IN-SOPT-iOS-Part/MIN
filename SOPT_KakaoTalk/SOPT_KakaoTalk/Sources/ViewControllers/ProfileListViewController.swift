import UIKit
import SnapKit
import Then
 
//MARK: - ProfileListViewController

class ProfileListViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let titleView = UIView()
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    private let settingButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "settings 1"), for: .normal)
    }
    
    private let profileListView = UIView()
    private let profileView = UIView()
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "friendtab_profileImg")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addTapGestures()
        
    }
    
    //MARK: - Properties
    
    var name: String?
    
    
    //MARK: - Functions
    
    func dataBind() {
        guard let name = self.name else {return}
        self.nameLabel.text = name
    }
    
    //MARK: - Private functions
    
    private func addTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchupListView))
        profileListView.addGestureRecognizer(tapGesture)
    }
    
    private func presentProfileDetailVC() {
        let detailVC = ProfileDetailViewController()
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.name = self.nameLabel.text
        detailVC.dataBind()
        self.present(detailVC, animated: true, completion: nil)
    }
    
    //MARK: - Objc functions
    
    @objc func touchupListView() {
        self.presentProfileDetailVC()
    }

}

//MARK: - Extensions

extension ProfileListViewController {
    
    //MARK: - Layout
    
    private func layout() {
        view.addSubviews([titleView, profileListView])
        titleView.addSubviews([friendLabel, settingButton])
        profileListView.addSubviews([profileImageView, nameLabel])
        
        //화면 전환 고려하여 Navigation bar로 수정해 보기
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
        
        profileListView.snp.makeConstraints { make in
            make.top.equalTo(self.titleView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.profileImageView.snp.trailing).offset(10)
        }
        
    }
    
    //MARK: - Config
    
    private func config() {
        view.backgroundColor = .white

    }
}

