//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by Bertuğ Horoz on 17.11.2022.
//

import UIKit

class RootViewController: UIViewController , RootViewModelOutput{
    
    private let ViewModel : RootViewModel
    
    init(ViewModel: RootViewModel) {
        self.ViewModel = ViewModel
        super.init(nibName: nil, bundle: nil)
        ViewModel.output = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        ViewModel.checkLogin()
    }
    
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)
    }
    
    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
    }
}
