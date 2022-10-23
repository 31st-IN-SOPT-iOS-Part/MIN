import UIKit
import SnapKit
import Then

//MARK: - WelcomeViewController

class WelcomeViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let welcomeLabel = UILabel().then {
        $0.text = """
                    님
                    환영합니다
                    """
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let completeButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .systemYellow
        $0.layer.cornerRadius = 3
    }
    
    //MARK: - Properties
    
    var email: String?

    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addButtonActions()
    }
    
    //MARK: - functions
    
    func dataBind() {
        guard let email = self.email else {return}
        self.welcomeLabel.text = """
                                 \(email)님
                                 환영합니다
                                 """
    }
    
    //MARK: - private functions
    
    private func addButtonActions() {
        completeButton.addTarget(self, action: #selector(touchupCompleteButton), for: .touchUpInside)
    }
    
    private func goToFriendListViewController() {
        let listVC = FriendViewController()
        listVC.name = self.email
        listVC.dataBind()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(listVC, animated: true)
    }
    
    //MARK: - objc functions
    
    @objc
    private func touchupCompleteButton() {
        self.goToFriendListViewController()
    }
}

//MARK: - Extensions

extension WelcomeViewController {
    
    //MARK: - Layout
    
    private func layout() {
        view.addSubviews([welcomeLabel, completeButton])
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(197)
            make.centerX.equalToSuperview()
        }
        
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(117)
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-21)
            make.height.equalTo(44)
        }
    }
    
    //MARK: - Config
    
    private func config() {
        view.backgroundColor = .white
    }
}

