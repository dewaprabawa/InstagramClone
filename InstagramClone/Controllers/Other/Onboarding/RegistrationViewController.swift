//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    let imageBackground: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "gradient")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let imageTitleInstagram: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "instragram-text")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let facebookLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "facebook")
        image.contentMode = .scaleAspectFill
        return image
      }()
    
    let facebookLoginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Log in with Facebook", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize:  15)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
      }()
      
    
    let topLabelLanguange:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Languange: English (United States)"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let forgotToLoginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forget your login details? "
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let orLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "OR"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let leftHorizontalLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let rightHorizontalLineView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .white
         return view
     }()
    
    let getHelpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get help signing in", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize:  15)
      
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .clear
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let usernameField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Username....",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textfield.returnKeyType = .next
        textfield.leftViewMode = .always
        textfield.textColor = .white
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .clear
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.layer.borderWidth = 1.0
        return textfield
    }()
    
    private let emailField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Email....",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textfield.returnKeyType = .next
        textfield.leftViewMode = .always
        textfield.textColor = .white
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .clear
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.layer.borderWidth = 1.0
        return textfield
    }()
    
    private let passwordField:UITextField = {
        let textfield = UITextField()
        textfield.isSecureTextEntry = true
        textfield.attributedPlaceholder = NSAttributedString(string: "Password...",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textfield.textColor = .white
        textfield.returnKeyType = .continue
        textfield.leftViewMode = .always
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.layer.masksToBounds = true
        textfield.backgroundColor = .clear
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.cornerRadius = 8.0
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.layer.borderWidth = 1.0
        return textfield
    }()
    
    private let RegistrationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign up", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 8.0
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1.0
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        btn.addTarget(self, action: #selector(didSignUp), for: .touchUpInside)
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.insertSubview(imageBackground, at: 0)
        addSubviews()
        textfieldSetups()
        setupviews()
    }
    
    private func addSubviews(){
        view.addSubview(topLabelLanguange)
        view.addSubview(imageTitleInstagram)
    }
    
    @objc private func didSignUp(){
        usernameField.becomeFirstResponder()
        emailField.becomeFirstResponder()
        passwordField.becomeFirstResponder()
        
        guard let username = usernameField.text,!username.isEmpty,
            let email = emailField.text,!email.isEmpty,
            let password = passwordField.text,!password.isEmpty, password.count >= 8 else {
                return
        }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { (success) in
            DispatchQueue.main.async {
                if success{
                    
                }else{
                    
                }
            }
        }
        
    }
    
    
    private func textfieldSetups(){
        passwordField.delegate = self
        usernameField.delegate = self
    }
    
    private func setupviews(){
        
        let textFieldstackView = UIStackView(arrangedSubviews: [
               usernameField,
               emailField,
               passwordField,
               RegistrationButton
           ])
           textFieldstackView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(textFieldstackView)
           textFieldstackView.alignment = .fill
           textFieldstackView.distribution = .fillEqually
           textFieldstackView.axis = .vertical
           textFieldstackView.spacing = 10
        
        let forgetToLogStackView = UIStackView(arrangedSubviews: [
            forgotToLoginLabel,
            getHelpButton
        ])
        
        view.addSubview(forgetToLogStackView)
        forgetToLogStackView.translatesAutoresizingMaskIntoConstraints = false
        forgetToLogStackView.axis = .horizontal
        forgetToLogStackView.distribution = .fillEqually
      
        let HorizontalLineStackView = UIStackView(arrangedSubviews: [
            leftHorizontalLineView,
            orLabel,
            rightHorizontalLineView
        ])
        
        HorizontalLineStackView.translatesAutoresizingMaskIntoConstraints = false
        HorizontalLineStackView.axis = .horizontal
        HorizontalLineStackView.alignment = .center
        HorizontalLineStackView.distribution = .fillEqually
        HorizontalLineStackView.spacing = 0
        view.addSubview(HorizontalLineStackView)
        
        
        let facebookLoginStackView = UIStackView(arrangedSubviews: [
        facebookLogo,
        facebookLoginButton
        ])
        
        facebookLoginStackView.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginStackView.alignment = .fill
        facebookLoginStackView.axis = .horizontal
        facebookLoginStackView.distribution = .equalCentering
        view.addSubview(facebookLoginStackView)
        
      
        
        
        NSLayoutConstraint.activate([
            topLabelLanguange.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabelLanguange.heightAnchor.constraint(equalToConstant: 20),
            topLabelLanguange.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageTitleInstagram.topAnchor.constraint(equalTo: topLabelLanguange.bottomAnchor, constant: view.frame.height/10),
            imageTitleInstagram.heightAnchor.constraint(equalToConstant: 100),
            imageTitleInstagram.widthAnchor.constraint(equalToConstant: 100),
            imageTitleInstagram.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            textFieldstackView.topAnchor.constraint(equalTo: imageTitleInstagram.bottomAnchor,constant: 30),
            textFieldstackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            textFieldstackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            textFieldstackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            forgetToLogStackView.topAnchor.constraint(equalTo: textFieldstackView.bottomAnchor,constant: 30),
            forgetToLogStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 38),
            forgetToLogStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -38),
            forgetToLogStackView.heightAnchor.constraint(equalToConstant: 20),
            
            HorizontalLineStackView.topAnchor.constraint(equalTo: forgetToLogStackView.bottomAnchor,constant: 30),
            HorizontalLineStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            HorizontalLineStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            HorizontalLineStackView.heightAnchor.constraint(equalToConstant: 10),
           
            leftHorizontalLineView.heightAnchor.constraint(equalToConstant: 1),
            rightHorizontalLineView.heightAnchor.constraint(equalToConstant: 1),
            orLabel.widthAnchor.constraint(equalToConstant: 20),
            
            
            facebookLogo.heightAnchor.constraint(equalToConstant: 30),
            facebookLogo.widthAnchor.constraint(equalToConstant: 30),
            
            facebookLoginStackView.topAnchor.constraint(equalTo: HorizontalLineStackView.bottomAnchor,constant: 30),
            facebookLoginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 120),
            facebookLoginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -90),
            facebookLoginStackView.heightAnchor.constraint(equalToConstant: 10),
            
        ])
    }

}


extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            usernameField.becomeFirstResponder()
        }else if textField == passwordField{
            passwordField.becomeFirstResponder()
        }else{
            didSignUp()
        }
        
        return true
    }
}
