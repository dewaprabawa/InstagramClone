//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

struct SettingModelCell {
    let title: String
    var handle: (()->Void)
}

class SettingsViewController: UIViewController {

    private let tableView:UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    private var data = [[SettingModelCell]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Setting"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
        configureModel()
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModel(){
        
        let section1 = [
            SettingModelCell(title: "Edit Profile", handle: { [weak self] in
                self?.didTapEditProfile()
            }),
            SettingModelCell(title: "Invite Friends", handle: { [weak self] in
                self?.didTapInviteFriend()
            }),
            SettingModelCell(title: "Seved Original Post", handle: { [weak self] in
                self?.didTapSaveOrginalPost()
            }),
        ]
        
        let section2 = [
            SettingModelCell(title: "Tearm of Service", handle: { [weak self] in
                self?.didTapTermOfService()
            }),
            SettingModelCell(title: "Privacy Policy", handle: { [weak self] in
                self?.didTapPrivacyPolicy()
            }),
            SettingModelCell(title: "Help / Feedback", handle: { [weak self] in
                self?.didTapHelpAndFeed()
            }),
        ]
        
        let section3 = [
            SettingModelCell(title: "Log Out", handle: { [weak self] in
                self?.didTapLogOut()
            })
        ]
        
        data.append(section1)
        data.append(section2)
        data.append(section3)
    }
    
    enum SettingsURLType {
        case term
        case privacy
        case help
    }
    
    private func openURL(with type:SettingsURLType){
        switch(type){
        case .term:
            self.URLLauncher(with: "https://www.instagram.com/about/legal/terms/before-january-19-2013/")
        case .privacy:
            self.URLLauncher(with: "https://help.instagram.com/196883487377501?ref=dp)")
        case .help:
            self.URLLauncher(with: "https://help.instagram.com/196883487377501?ref=dp)")
        }
    }
    
    private func URLLauncher(with url: String){
        if let url = URL(string: url), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func didTapEditProfile(){
        
    }
    
    private func didTapInviteFriend(){
        
    }
    
    private func didTapSaveOrginalPost(){
        
    }
    
    private func didTapTermOfService(){
        openURL(with: .term)
    }
    
    private func didTapPrivacyPolicy(){
        openURL(with: .privacy)
    }
    
    private func didTapHelpAndFeed(){
        openURL(with: .help)
    }
    
    private func didTapLogOut(){
        let alertController = UIAlertController(title: "Log Out", message: "Are you sure want to log out ?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            self.logOut()
            }))
        
        alertController.popoverPresentationController?.sourceView = tableView
        alertController.popoverPresentationController?.sourceRect = tableView.bounds
        present(alertController, animated: true, completion: nil)
    }

    private func logOut(){
        AuthManager.shared.signOutUser { (success) in
            DispatchQueue.main.async {
                if success {
                    ///Present Log in
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true) {
                        self.navigationController?.popToRootViewController(animated: true)
                        self.tabBarController?.selectedIndex = 0
                    }
                }else{
                    /// error occurred
                    fatalError("could not log out the user")
                }
            }
        }
        
    }
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handle()
    }

}
