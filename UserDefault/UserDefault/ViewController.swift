//
//  ViewController.swift
//  UserDefault
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    private let logoutButton:UIButton = {
       let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.addSubview(logoutButton)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkAuth()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 40, y: 200, width: view.width - 80, height: 40)
        logoutButton.frame = CGRect(x: 40, y: myLabel.bottom + 20, width: view.width - 80, height: 40)
    }
    private func checkAuth()
    {
        if let uname = UserDefaults.standard.string(forKey: "username"){
            myLabel.text = "Welcome \(uname)"
        } else {
            //print("not logged in")
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(true, animated: false)
            present(nav,animated: false)
        }
    }
    @objc private func logoutTapped() {
        UserDefaults.standard.setValue(nil, forKey: "username")
        checkAuth()
    }
}

