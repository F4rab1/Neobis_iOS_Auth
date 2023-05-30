//
//  LoginViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 30.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var textFieldHeight: CGFloat = 0
    var buttonHeight: CGFloat = 0
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.bounds.size.height))
        tf.placeholder = "Электронная почта"
        tf.keyboardType = .emailAddress
        tf.textContentType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.bounds.size.height))
        tf.placeholder = "Пароль"
        return tf
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#5D5FEF")
        button.layer.cornerRadius = 16
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let forgotPassButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(forgotPassButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width
        textFieldHeight = (screenHeight / 812) * 60
        buttonHeight = (screenHeight / 812) * 65
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(forgotPassButton)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func signInPressed() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func forgotPassButtonPressed() {
        print("Forgot button pressed need to be implemented!!!")
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 52)
            make.leading.equalToSuperview().offset((screenWidth / 375) * 20)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 76)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 236)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset((screenHeight / 812) * 24)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset((screenHeight / 812) * 60)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(buttonHeight)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset((screenHeight / 812) * 44)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(buttonHeight)
        }
        
//            .offset((screenHeight / 812) * 154)
//            .inset((screenWidth / 375) * 20) 28
    }

}
