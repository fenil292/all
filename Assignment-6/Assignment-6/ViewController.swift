//
//  ViewController.swift
//  Assignment-6
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let Logo:UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "paytm.png")
        return img
    }()
    private let myPage:UIPageControl = {
        let Page = UIPageControl()
        Page.numberOfPages = 2
        Page.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        
        return Page
    }()
    private let myTextField:UITextField = {
       let textfield = UITextField()
        textfield.placeholder = "Enter Your Name"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let mobile:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Your Mobile No"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let nextbtn:UIButton = {
       let btn = UIButton()
        btn.setTitle("Next", for: .normal)
        btn.addTarget(self, action: #selector(btn_next), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
                return btn
    }()
    
    @objc func btn_next()
    {
        let vc = Screen2()
        navigationController?.pushViewController(vc, animated: true)
        //spresent(vc,animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(myPage)
        view.addSubview(myTextField)
        view.addSubview(mobile)
        view.addSubview(Logo)
        view.addSubview(nextbtn)
        navigationController?.setNavigationBarHidden(true, animated: false)   // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Logo.frame = CGRect(x: 120, y: 40, width: 150, height: 150)
        myPage.frame = CGRect(x: 20, y: Logo.bottom + 40, width: view.width - 40, height: 40)
        myTextField.frame = CGRect(x: 20, y: myPage.bottom + 40, width: view.width - 40, height: 40)
        mobile.frame = CGRect(x: 20, y: myTextField.bottom + 40, width: view.width - 40, height: 40)
        nextbtn.frame = CGRect(x: 20, y: mobile.bottom + 40, width: view.width - 40, height: 40)
        
    }
}

