//
//  Screen2.swift
//  Assignment-6
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen2: UIViewController {
    private let Logo1:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "paytm.png")
        return img
    }()
    private let myPage1:UIPageControl = {
        let Page = UIPageControl()
        Page.numberOfPages = 2
        Page.currentPage = 1
        Page.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        return Page
    }()
    private let otp:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Your OTP"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let verifybtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Verify", for: .normal)
        btn.addTarget(self, action: #selector(btn_verify), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    /*private let myLabel:UILabel = {
        let label = UILabel()
        label.text="Resend Code: 00:"
        
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    private let lblsec:UILabel = {
        let label = UILabel()
        label.text="30"
        label.backgroundColor = .white
        return label
    }()*/
    /*private let myProcessView:UIProgressView = {
        let pview = UIProgressView()
        pview.setProgress(0.0, animated: true)
        return pview
    }()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 30.0) {
            self.myProcessView.setProgress(1.0, animated: true)
            self.lblsec.text = "\(Int(self.myProcessView.progress * 100))"
        }
        /*let s:Int? = Int(self.myLabel.text ?? "30" ) ?? 30 - 1
        self.myLabel.text = "\(String(describing: s))"
        print(self.myProcessView.progress)*/
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myPage1)
        view.addSubview(Logo1)
        view.addSubview(otp)
        view.addSubview(verifybtn)
        //view.addSubview(myLabel)
        //view.addSubview(myProcessView)
        //view.addSubview(lblsec)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Logo1.frame = CGRect(x: 120, y: 40, width: 150, height: 150)
        myPage1.frame = CGRect(x: 20, y: Logo1.bottom + 40, width: view.width - 40, height: 40)
        otp.frame = CGRect(x: 20, y: myPage1.bottom + 40, width: view.width - 40, height: 40)
        //myLabel.frame = CGRect(x: 20, y: otp.bottom + 10, width: 60, height: 40)
        //lblsec.frame = CGRect(x: myLabel.right, y: otp.bottom + 10, width: view.width - 40, height: 40)
        //myProcessView.frame = CGRect(x: 20, y: otp.bottom + 5, width: view.width - 40, height: 5)
        verifybtn.frame = CGRect(x: 20, y: otp.bottom + 20, width: view.width - 40, height: 40)
    }
    @objc func btn_verify()
    {
        print("fkbn")
        let vc = Screen3()
        navigationController?.pushViewController(vc, animated: true)
        //present(vc,animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
