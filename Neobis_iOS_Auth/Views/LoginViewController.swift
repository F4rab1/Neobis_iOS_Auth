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
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
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
        
//            .offset((screenHeight / 812) * 154)
//            .inset((screenWidth / 375) * 20) 28
    }

}
