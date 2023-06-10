//
//  RegistrationService.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 07.06.2023.
//

import Foundation

class RegistrationService {
    func register(email: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let baseURL = URL(string: "http://34.107.1.158/auth/")!
        let registerURL = baseURL.appendingPathComponent("register-for-mobile")
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "email": email
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            } else if let data = data {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
