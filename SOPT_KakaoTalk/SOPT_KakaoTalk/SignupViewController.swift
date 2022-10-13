import UIKit
import SnapKit

//MARK: - SignupViewController
class SignupViewController: UIViewController {
    
    //MARK: - UI Components
    //카카오톡을 시작합니다 label
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        
        return label
    }()
    
    //email textField
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        
        return textField
    }()
    
    //email line view
    private let emailLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        
        return line
    }()
    
    //password textField
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    //password line View
    private let passwordLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        
        return line
    }()
    
    //checkPassword textField
    private let checkPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    //checkPassword line View
    private let checkPasswordLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        
        return line
    }()
    
    //signup button
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        button.layer.cornerRadius = 3
        
        return button
    }()
    
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
    private func addButtonAction() {
        signupButton.addTarget(self, action: #selector(touchupSignupButton), for: .touchUpInside)
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.email = self.emailTextField.text
        welcomeVC.dataBind()
        
        self.present(welcomeVC, animated: true)
    }
    
    private func setTextField() {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        self.checkPasswordTextField.text = ""
    }
    
    //MARK: - Objc functions
    @objc
    private func touchupSignupButton() {
        self.presentToWelcomeVC()
    }
}

//MARK: - Extensions
extension SignupViewController {
    
    //MARK: - Layout
    private func layout() {
        view.addSubviews([startLabel, emailTextField, emailLineView, passwordTextField, passwordLineView, checkPasswordTextField, checkPasswordLineView, signupButton])
        
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(116)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(49)
        }
        
        emailLineView.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom)
            make.centerX.equalTo(self.emailTextField)
            make.width.equalTo(self.emailTextField)
            make.height.equalTo(1)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.emailTextField)
            make.width.equalTo(self.emailTextField)
            make.height.equalTo(49)
        }
        
        passwordLineView.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom)
            make.centerX.equalTo(self.passwordTextField)
            make.width.equalTo(self.passwordTextField)
            make.height.equalTo(1)
        }
        
        checkPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordLineView.snp.bottom).offset(10)
            make.centerX.equalTo(self.passwordTextField)
            make.width.equalTo(self.passwordTextField)
            make.height.equalTo(49)
        }
        
        checkPasswordLineView.snp.makeConstraints { make in
            make.top.equalTo(self.checkPasswordTextField.snp.bottom)
            make.centerX.equalTo(self.checkPasswordTextField)
            make.width.equalTo(self.checkPasswordTextField)
            make.height.equalTo(1)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(self.checkPasswordTextField.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.emailTextField)
            make.height.equalTo(44)
        }
        
     
    }
    
    //MARK: - Config
    private func config() {
        view.backgroundColor = .white

    }
}


