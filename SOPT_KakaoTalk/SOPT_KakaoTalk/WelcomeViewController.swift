import UIKit
import SnapKit

//MARK: - WelcomeViewController
class WelcomeViewController: UIViewController {
    
    //MARK: - UI Components
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    님
                    환영합니다
                    """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 3
        
        return button
    }()
    
    //MARK: - Properties
    var email: String?

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addButtonActions()
    }
    
    //MARK: - private functions
    private func addButtonActions() {
        completeButton.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
    }
    
    //MARK: - objc functions
    @objc
    private func touchupBackButton() {
        guard let presentingVC = presentingViewController as? UINavigationController else {return}
        self.dismiss(animated: true) {
            presentingVC.popViewController(animated: true)
        }
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

