//
//  ViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 30.05.2023.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var buttonHeight: CGFloat = 0
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#5D5FEF")
        label.textAlignment = .left
        label.text = "Смейся \nи улыбайся \nкаждый день"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#5D5FEF")
        button.layer.cornerRadius = 16
        button.setTitle("Начать пользоваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Есть аккаунт? Войти", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width
        buttonHeight = (screenHeight / 812) * 65
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        
        view.addSubview(signUpButton)
        view.addSubview(signInButton)
    }
    
    @objc private func signUpPressed() {
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func signInPressed() {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 154)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset((screenHeight / 812) * 60)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset((screenHeight / 812) * 125)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(buttonHeight)
        }
        
        signInButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset((screenHeight / 812) * 44)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(buttonHeight)
        }
    }
}

