//
//  LoginStorageServiceIMPL.swift
//  LoginProtocolOriented
//
//  Created by Bertuğ Horoz on 18.11.2022.
//

import Foundation

class LoginStorageServiceImpl : LoginStorageService {
    
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "Access_Token"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
