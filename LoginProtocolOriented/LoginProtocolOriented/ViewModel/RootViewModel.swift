//
//  RootViewModel.swift
//  LoginProtocolOriented
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import Foundation

class RootViewModel{
    
    private let LoginStorageService : LoginStorageService
    
    weak var output : RootViewModelOutput?
    
    init(LoginStorageService: LoginStorageService) {
        self.LoginStorageService = LoginStorageService
    }
    
    func checkLogin() {
        if let accessToken = LoginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            output?.showMainApp()
        }else{
            output?.showLogin()
        }
        
    }
    
}
