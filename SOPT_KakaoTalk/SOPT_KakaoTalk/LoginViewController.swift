import UIKit
import SnapKit

//MARK: - LoginViewController
class LoginViewController: UIViewController {
    
    //MARK: - UI components
    //카카오톡을 시작합니다 label
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        
        return label
    }()
    
    //detail label
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        
        return label
    }()
    
    //email textField
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        
        return textField
    }()
    
    //password textField
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    //email Line view
    private let emailLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    //password Line view
    private let passwordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()

    //login button
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        button.layer.cornerRadius = 3
        
        return button
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
    
    //find button
    private let findButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        
        return button
    }()

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.layout()
        self.config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setTextField()
    }
 
    //MARK: - Private functions
    
    private func setTextField() {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
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

