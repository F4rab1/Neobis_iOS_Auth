//
//  RegistrationService.swift
//  Neobis_iOS_Auth
//
//  Created by Фараби Иса on 07.06.2023.
//

import Foundation

class RegistrationService {
    func register(email: String, completion: @escaping (Result<String, Error>) -> Void) {
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
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    if let jsonObject = json as? [String: Any],
                       let email = jsonObject["email"] as? String,
                       let message = jsonObject["message"] as? String {
                        completion(.success("Verification message has been sent to your email: \(email). \(message)"))
                    } else if let jsonArray = json as? [[String: Any]] {
                        if let errorMessage = jsonArray.first?["email"] as? String {
                            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                        } else {
                            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                        }
                    } else {
                        completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
            }
        }
        
        task.resume()
    }
}
