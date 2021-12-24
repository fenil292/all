//
//  ViewController.swift
//  Ass7
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen1: UIViewController {
    private let loginlabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Recipe"
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 50)
        label.font = UIFont(name: "Optima-BoldItalic", size: 50)
        return label
    }()
    private let usernametextfield:UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Enter UserName"
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 0
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.7
        textfield.layer.shadowRadius = 4.0
        return textfield
    }()
    private let passtextfield:UITextField = {
        let textfield = UITextField()
        textfield.textColor = .black
        textfield.placeholder = "Enter Password"
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 15.0
        textfield.backgroundColor = .white
        textfield.layer.borderWidth = 0
        textfield.layer.shadowColor = UIColor.black.cgColor
        textfield.layer.shadowOffset = CGSize(width: 3, height: 3)
        textfield.layer.shadowOpacity = 0.7
        textfield.layer.shadowRadius = 4.0
        return textfield
    }()
    private let loginbutton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(loginClickbtn), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.7
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "image1.jpg")!)
        self.view.contentMode = .scaleToFill
        view.addSubview(loginlabel)
        view.addSubview(usernametextfield)
        view.addSubview(passtextfield)
        view.addSubview(loginbutton)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginlabel.frame = CGRect(x: 90, y: 80, width: 200, height: 100)
        usernametextfield.frame = CGRect(x: 90, y: 200, width: 250, height: 40)
        passtextfield.frame = CGRect(x: 90, y: usernametextfield.frame.origin.y+70, width: 250, height: 40)
        loginbutton.frame = CGRect(x: 90, y: passtextfield.frame.origin.y+70, width: 250, height: 40)
    }
    @objc func loginClickbtn(){
        let sc = Screen2()
        navigationController?.pushViewController(sc, animated: true)
    }
}
