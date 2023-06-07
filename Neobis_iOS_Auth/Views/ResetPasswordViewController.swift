//
//  ResetPasswordViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 02.06.2023.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var textFieldHeight: CGFloat = 0
    var buttonHeight: CGFloat = 0
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Сброс пароля"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#5D5FEF")
        label.textAlignment = .left
        label.text = "Смейся \nи улыбайся \nкаждый день"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        return label
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
    
    private let forwardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#5D5FEF")
        button.layer.cornerRadius = 16
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(forwardButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width
        textFieldHeight = (screenHeight / 812) * 60
        buttonHeight = (screenHeight / 812) * 65
        
        emailTextField.delegate = self

        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(logoImageView)
        view.addSubview(emailTextField)
        view.addSubview(forwardButton)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
    
    @objc private func forwardButtonPressed() {
        let vc = NewPasswordViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 52)
            make.leading.equalToSuperview().offset((screenWidth / 375) * 20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 55)
            make.centerX.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset((screenHeight / 812) * 37)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset((screenHeight / 812) * 22)
            make.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset((screenHeight / 812) * 60)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        forwardButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset((screenHeight / 812) * 60)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(buttonHeight)
        }
        
//            .offset((screenHeight / 812) * 154)
//            .inset((screenWidth / 375) * 20) 28
    }

}

extension ResetPasswordViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let placeholder = textField.placeholder, !placeholder.isEmpty else {
            return
        }

        let placeholderInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)

        let placeholderLabel: UILabel = {
            let label = UILabel()
            label.text = placeholder
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .lightGray
            label.sizeToFit()
            textField.addSubview(label)
            textField.placeholder = ""
            return label
        }()

        placeholderLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.top).offset(placeholderInsets.top)
            make.leading.equalTo(textField.snp.leading).offset(placeholderInsets.left)
        }

        UIView.animate(withDuration: 0.3) {
            placeholderLabel.alpha = 1.0
        }
    }
}
