import UIKit
import SnapKit
import Then

//MARK: - ProfileDetailViewController

class ProfileDetailViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let backButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
    }
    
    private lazy var profileStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 5
    }

    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile_userImg")
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .white
    }
    
    private let menuLineView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let menuStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    private let chatContainerView = UIView()
    private let editProfileContainerView = UIView()
    private let kakaoStoryContainerView = UIView()
    
    //chat button
    private let chatStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }
    
    private let chatImageView = UIImageView().then {
        $0.image = UIImage(named: "profileTalkImg")
    }

    private let chatLabel = UILabel().then {
        $0.text = "나와의 채팅"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .white
    }
    
    //edit profile button
    private let editProfileStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }
    
    private let editProfileImageView = UIImageView().then {
        $0.image = UIImage(named: "profile_editImg")
    }
    
    private let editProfileLabel = UILabel().then {
        $0.text = "프로필 편집"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .white
    }
    
    //kakaoStory Button
    private let kakaoStoryStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }
    
    private let kakaoStoryImageView = UIImageView().then {
        $0.image = UIImage(named: "profileStoryImg")
    }
    
    private let kakaoStoryLabel = UILabel().then {
        $0.text = "카카오스토리"
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = .white
    }
    
    //MARK: - Properties
    
    var name: String?
    
    
    //MARK: - Functions
    
    func dataBind() {
        guard let name = self.name else {return}
        self.nameLabel.text = name
    }
    
    
    //MARK: - Private functions
    
    private func addViewTapGestures() {
        let chatViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupChatContainerView))
        chatContainerView.addGestureRecognizer(chatViewGesture)
        
        let editProfileViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupEditProfileContainerView))
        editProfileContainerView.addGestureRecognizer(editProfileViewGesture)
        
        let kakaoStoryViewGesture = UITapGestureRecognizer(target: self, action: #selector(touchupKakaoStoryContainerView))
        kakaoStoryContainerView.addGestureRecognizer(kakaoStoryViewGesture)
    }
    
    private func addButtonActions() {
        backButton.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
    }
    
    private func goToBackVC() {
        self.dismiss(animated: true, completion: nil)
    }
    

    //MARK: - Objc functions
    
    @objc func touchupChatContainerView() {
        print("나와의 채팅 클릭됨!")
    }
    
    @objc func touchupEditProfileContainerView() {
        print("프로필 편집 클릭됨!")
    }
    
    @objc func touchupKakaoStoryContainerView() {
        print("카카오스토리 클릭됨!")
    }
    
    @objc func touchupBackButton() {
        self.goToBackVC()
    }

    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addViewTapGestures()
        self.addButtonActions()
    }
}

//MARK: - Extensions

extension ProfileDetailViewController {
    
    //MARK: - Layout
    
    private func layout() {
        view.addSubviews([backButton, profileStackView, menuStackView, menuLineView])
        
        profileStackView.addArrangedSubviews([profileImageView, nameLabel])
        menuStackView.addArrangedSubviews([chatContainerView, editProfileContainerView, kakaoStoryContainerView])
        
        chatContainerView.addSubview(chatStackView)
        chatStackView.addArrangedSubviews([chatImageView, chatLabel])
        
        editProfileContainerView.addSubview(editProfileStackView)
        editProfileStackView.addArrangedSubviews([editProfileImageView, editProfileLabel])
        
        kakaoStoryContainerView.addSubview(kakaoStoryStackView)
        kakaoStoryStackView.addArrangedSubviews([kakaoStoryImageView, kakaoStoryLabel])
        
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(13)
            make.height.equalTo(14)
        }
        
        menuStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-47)
            make.centerX.equalToSuperview()
            make.width.equalTo(288)
            make.height.equalTo(72)
        }
        
        chatStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        editProfileStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        kakaoStoryStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        
        menuLineView.snp.makeConstraints { make in
            make.bottom.equalTo(self.menuStackView.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        profileStackView.snp.makeConstraints { make in
            make.bottom.equalTo(self.menuLineView.snp.top).offset(-42)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(130)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.width.equalTo(profileImageView.snp.height).multipliedBy(1.0 / 1.0)
        }
        
        
    }
    
    //MARK: - Config
    
    private func config() {
        view.backgroundColor = UIColor(red: 133/255, green: 145/255, blue: 153/255, alpha: 1.0)
    }

}

