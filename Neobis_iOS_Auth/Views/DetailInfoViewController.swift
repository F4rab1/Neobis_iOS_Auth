//
//  DetailInfoViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 31.05.2023.
//

import UIKit

class DetailInfoViewController: UIViewController {
    
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var textFieldHeight: CGFloat = 0
    var buttonHeight: CGFloat = 0
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.bounds.size.height))
        tf.placeholder = "Имя"
        return tf
    }()
    
    private let surnameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.bounds.size.height))
        tf.placeholder = "Фамилия"
        return tf
    }()
    
    private let birthDayTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .secondarySystemBackground
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: tf.bounds.size.height))
        tf.placeholder = "Дата рождения"
        tf.keyboardType = .decimalPad
        tf.textContentType = .dateTime
        return tf
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
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#5D5FEF")
        button.layer.cornerRadius = 16
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenHeight = UIScreen.main.bounds.height
        screenWidth = UIScreen.main.bounds.width
        textFieldHeight = (screenHeight / 812) * 60
        buttonHeight = (screenHeight / 812) * 65
        
        nameTextField.delegate = self
        surnameTextField.delegate = self
        birthDayTextField.delegate = self
        emailTextField.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(birthDayTextField)
        view.addSubview(emailTextField)
        view.addSubview(signUpButton)
    }
    
    @objc private func signUpPressed() {
        let vc = CreatePasswordViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func setupConstraints() {
        nameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 84)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset((screenHeight / 812) * 24)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        birthDayTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset((screenHeight / 812) * 24)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(birthDayTextField.snp.bottom).offset((screenHeight / 812) * 24)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset((screenHeight / 812) * 44)
            make.leading.trailing.equalToSuperview().inset((screenWidth / 375) * 20)
            make.height.equalTo(textFieldHeight)
        }
    }

}

extension DetailInfoViewController: UITextFieldDelegate {
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
