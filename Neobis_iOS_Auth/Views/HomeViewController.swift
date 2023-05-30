//
//  HomeViewController.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 30.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screenHeight: CGFloat = 0
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "logo")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#5D5FEF")
        label.textAlignment = .center
        label.text = "Добро пожаловать\nСмейся \nи улыбайся \nкаждый день"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        screenHeight = UIScreen.main.bounds.height
        
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((screenHeight / 812) * 154)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    
}
