//
//  NotificationViewController.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupviews()
    }
    
    private func setupviews(){
        navigationSetup()
        tableviewSetups()
    }
    
    private func navigationSetup(){
        self.title = "Notification"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func tableviewSetups(){
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableview)
        tableview.pin(to: view)
    }

}


extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
