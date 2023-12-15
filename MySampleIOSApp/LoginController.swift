//
//  LoginController.swift
//  MySampleIOSApp
//
//  Created by Zyauddin Khan on 05/12/23.
//

import UIKit

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Login"
        setupLoginBarButton()
    }
    
    func setupLoginBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(handleLogin))
    }
    
    @objc func handleLogin() {
        let ud = UserDefaults.standard
        ud.set(true, forKey: ProfileController.isLoggedIn)
        
        guard let  mainTabbarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabbarController else { return }
        mainTabbarController.setupViewControllers()
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
