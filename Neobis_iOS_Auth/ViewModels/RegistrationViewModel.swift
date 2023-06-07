//
//  RegistrationViewModel.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 06.06.2023.
//

import Foundation
import UIKit

protocol RegistrationViewModelType {
    var didRegister: (() -> Void)? { get set }
    func register(email: String)
}

class RegistrationViewModel: RegistrationViewModelType {
    
    private let registrationService: RegistrationService
    
    init(registrationService: RegistrationService) {
        self.registrationService = registrationService
    }
    
    var didRegister: (() -> Void)?
    
    func register(email: String) {
        registrationService.register(email: email) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    print(message)
                    self?.showNextViewController()
                case .failure(let error):
                    print("Registration Error: \(error)")
                }
            }
        }
    }
    
    private func showNextViewController() {
        didRegister?()
    }
}
