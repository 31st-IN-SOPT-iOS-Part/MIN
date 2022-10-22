import UIKit
import SnapKit
import Then

//MARK: - LoginViewController

class LoginViewController: UIViewController {
    
    //MARK: - UI components
    
    //카카오톡을 시작합니다 label
    private let startLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    //detail label
    private let detailLabel = UILabel().then {
        $0.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = .darkGray
    }
    
    //email textField
    private let emailTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
    }
    
    //password textField
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
    }
    
    //email Line view
    private let emailLineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    //password Line view
    private let passwordLineView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    //login button
    private let loginButton = UIButton().then {
        $0.setTitle("카카오계정 로그인", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        $0.layer.cornerRadius = 3
    }
    
    //signup button
    private let signupButton = UIButton().then {
        $0.setTitle("새로운 카카오계정 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        $0.layer.cornerRadius = 3
    }
    
    //find button
    private let findButton = UIButton().then {
        $0.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
    }

    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
        self.addButtonAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setTextField()
    }
 
    //MARK: - Private functions
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.email = self.emailTextField.text
        welcomeVC.dataBind()
        
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    private func pushToSignupVC() {
        let signupVC = SignupViewController()

        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    private func addButtonAction() {
        loginButton.addTarget(self, action: #selector(touchupLoginButton), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(touchupSignupButton), for: .touchUpInside)
    }
    
    private func setTextField() {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    //MARK: - Objc functions
    
    @objc
    private func touchupLoginButton() {
        self.presentToWelcomeVC()
    }
    
    @objc
    private func touchupSignupButton() {
        self.pushToSignupVC()
    }
    
 

}

//MARK: - Extensions

extension LoginViewController {
    
    //MARK: - Layout
    
    private func layout() {
        view.addSubviews([startLabel, detailLabel, emailTextField, emailLineView, passwordTextField, passwordLineView, loginButton, signupButton, findButton])
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.detailLabel.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(49)
        }
        
        emailLineView.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailLineView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(49)
        }
        
        passwordLineView.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordLineView.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(44)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(44)
        }
        
        findButton.snp.makeConstraints { make in
            make.top.equalTo(self.signupButton.snp.bottom).offset(15)
            make.centerX.equalTo(self.signupButton)
            
        }
    }
    
    //MARK: - Config
     
    private func config() {
        view.backgroundColor = .white
    }
}

