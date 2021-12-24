//
//  LoginVC.swift
//  UserDefault
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.frame = CGRect(x: 40, y: 200, width: view.width - 80, height: 40)
    }
    @objc private func loginTapped() {
        UserDefaults.standard.setValue("fenil", forKey: "username")
        self.dismiss(animated: true)
    }
}
