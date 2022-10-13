
import UIKit
import SnapKit
 
//MARK: - ProfileListViewController
class ProfileListViewController: UIViewController {
    
    //MARK: - UI Components
    private let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        
        return label
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "settings 1"), for: .normal)
        
        return button
    }()
    
    private let profileListView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "friendtab_profileImg")
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "김민"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return label
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
    }

}

//MARK: - Extensions
extension ProfileListViewController {
    
    //MARK: - Layout
    private func layout() {
        view.addSubviews([titleView, profileListView])
        titleView.addSubviews([friendLabel, settingButton])
        profileListView.addSubviews([profileView, nameLabel])
        profileView.addSubview(profileImageView)
        
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
        
        profileView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
            make.width.equalTo(59)
            make.height.equalTo(58)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.profileView.snp.trailing).offset(10)
        }
        
    }
    
    //MARK: - Config
    private func config() {
        view.backgroundColor = .white

    }
}

