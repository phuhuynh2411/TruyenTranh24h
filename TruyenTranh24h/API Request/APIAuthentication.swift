//
//  APIAuthentication.swift
//  Agile Board Team
//
//  Created by Huynh Tan Phu on 5/20/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import Foundation
import Combine

class APIAuthentication: API {
    
    static var shared = APIAuthentication()
    private var loginURL: URL
    
    init(loginURL: URL = URLSetting.loginURL) {
        self.loginURL = loginURL
    }
    
    private func buildLoginRequest(_ username: String, _ password: String) -> URLRequest {
        var request = self.postRequest(url: self.loginURL)
        let json = [
            "email": username,
            "password": password
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        request.httpBody = jsonData
        
        return request
    }
    
    private func postLogin(_ username: String, _ password: String) -> AnyPublisher<Entry<ResponseData>, Error> {
        let request =  self.buildLoginRequest(username, password)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func login(_ username: String, _ password: String) -> AnyPublisher<Token, Error> {
        return postLogin(username, password) // Entry/ Error
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    internal func validate(entry: Entry<ResponseData>) throws -> Token {
        guard entry.meta.success, entry.meta.statusCode == 200 else {
            throw AuthenticationError.invalidCredential(entry.meta.message)
        }
        guard let token = entry.data?.accessToken, !token.isEmpty else {
            throw AuthenticationError.emptyToken
        }
        self.completeAuthentication(with: token)
        
        return Token(accessToken: token)
    }
    
    private func completeAuthentication(with token: String) {
        // Save access token to the user default
        TokenManager.shared.setToken(token)
        // Post a notification
        NotificationCenter.default.post(name: .didLoginSucceed, object: self, userInfo: [UserDefaultKey.accessToken: token])
    }
    
    // MARK: - ResponseData
    struct ResponseData: Codable {
        var accessToken: String
        var tokenType: String
        var expiresIn: Int
        //var user: User
    }
    
    // MARK: - Authentication Error
    
    enum AuthenticationError: Error, LocalizedError, Equatable {
        case invalidCredential(String)
        case emptyToken
        
        var errorDescription: String? {
            switch self {
            case .invalidCredential(let errorMessage):
                return NSLocalizedString(errorMessage, comment: "")
            case .emptyToken:
                return NSLocalizedString("The access token is empty.", comment: "")
            }
        }
    }
}
