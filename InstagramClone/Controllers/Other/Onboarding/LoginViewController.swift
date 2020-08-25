//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameField: UITextField = {
        let textfield = UITextField()
        return textfield
    }()
    
    private let passwordField:UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private let termButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private let privacyButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private let createAccountButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    private func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLogin(){}
    @objc private func didTapTerm(){}
    @objc private func didTapPrivacy(){}
    @objc private func didTapCreateAccount(){}
    
}
