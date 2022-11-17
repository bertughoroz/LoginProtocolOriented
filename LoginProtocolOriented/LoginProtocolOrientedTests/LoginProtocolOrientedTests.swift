//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {

    private var viewModel : RootViewModel!
    private var loginStorageService : MockLoginStrageservice!
    private var output : MockRootViewModelOutput!
    
    override func setUpWithError() throws {
        loginStorageService = MockLoginStrageservice()
        viewModel = RootViewModel(LoginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
    }

    override func tearDownWithError() throws {
  
        viewModel = nil
        loginStorageService = nil
        
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccesToken() throws {

        loginStorageService.storage = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login)
        
    }

    
    func testShowMainApp_whenLoginStorageReturnsUserAccesToken() throws {

        loginStorageService.storage["Access_Token"] = "131122312asdf12f1s"
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .mainApp)
        
    }

}

class MockLoginStrageservice : LoginStorageService {
    var userAccessTokenKey: String{
        return "Access_Token"
    }
    
    var storage : [String : String] = [:]
    
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
    
}


class MockRootViewModelOutput : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
    }
    var checkArray : [Check] = []
    
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }

}
