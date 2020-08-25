//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    struct Constants {
        static let cornerRadius:CGFloat = 8.0
    }
    
    
    private let usernameField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username or Email...."
        textfield.returnKeyType = .next
        textfield.leftViewMode = .always
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .secondarySystemBackground
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = Constants.cornerRadius
        textfield.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        textfield.layer.borderWidth = 1.0
        return textfield
    }()
    
    private let passwordField:UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.placeholder = "Password..."
        textfield.returnKeyType = .continue
        textfield.leftViewMode = .always
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .secondarySystemBackground
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = Constants.cornerRadius
        textfield.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        textfield.layer.borderWidth = 1.0
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log in", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = Constants.cornerRadius
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return btn
    }()
    
    private let termButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Term and Service", for: .normal)
        btn.setTitleColor(.secondaryLabel, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapTerm), for: .touchUpInside)
        return btn
    }()
    
    private let privacyButton: UIButton = {
         let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Privacy Policy", for: .normal)
        btn.setTitleColor(.secondaryLabel, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        return btn
    }()
    
    private let createAccountButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("New User? Create an Account", for: .normal)
        btn.setTitleColor(.label, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    

    
    private let instagramGradientImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradient")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupviews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
 
    
    private func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termButton)
        view.addSubview(privacyButton)
        view.addSubview(instagramGradientImage)
    }
    
    private func textfieldSetups(){
        usernameField.delegate = self
        usernameField.delegate = self
    }
    
    
    private func setupviews(){

        
        let instagramText = UIImageView(image: UIImage(named: "instragram-text"))
        instagramText.translatesAutoresizingMaskIntoConstraints = false
        instagramText.contentMode = .scaleAspectFit
        instagramGradientImage.addSubview(instagramText)
        
        NSLayoutConstraint.activate([
            instagramText.heightAnchor.constraint(equalToConstant: 100),
            instagramText.widthAnchor.constraint(equalToConstant: 200),
            instagramText.centerYAnchor.constraint(equalTo: instagramGradientImage.centerYAnchor),
            instagramText.centerXAnchor.constraint(equalTo: instagramGradientImage.centerXAnchor),
        
        ])
        
        
        let upperstackView = UIStackView(arrangedSubviews: [
        usernameField,
        passwordField,
        loginButton,
        createAccountButton,
        ])
        
        upperstackView.translatesAutoresizingMaskIntoConstraints = false
        upperstackView.alignment = .fill
        upperstackView.distribution = .fillEqually
        upperstackView.axis = .vertical
        upperstackView.spacing = 5
        view.addSubview(upperstackView)
        
        
        
        let lowerstackview = UIStackView(arrangedSubviews: [
        termButton,
        privacyButton
        ])
        
        lowerstackview.translatesAutoresizingMaskIntoConstraints = false
        lowerstackview.alignment = .fill
        lowerstackview.distribution = .fillEqually
        lowerstackview.axis = .vertical
        lowerstackview.spacing = 5
        view.addSubview(lowerstackview)
        
        NSLayoutConstraint.activate([
        instagramGradientImage.topAnchor.constraint(equalTo: view.topAnchor),
        instagramGradientImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        instagramGradientImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        instagramGradientImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            
        upperstackView.topAnchor.constraint(equalTo: instagramGradientImage.bottomAnchor,constant: 20),
        upperstackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
        upperstackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        upperstackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
         
        
        lowerstackview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        lowerstackview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        lowerstackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        lowerstackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        ])
    }
    
    @objc private func didTapLogin(){}
    @objc private func didTapTerm(){}
    @objc private func didTapPrivacy(){}
    @objc private func didTapCreateAccount(){}
    
}


extension LoginViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField{
            didTapLogin()
        }
        
        return true
    }
}
