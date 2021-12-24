//
//  Screen3.swift
//  Assignment-6
//
//  Created by DCS on 08/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen3: UIViewController {
    private let myImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40.0
        image.image = UIImage(named: "person")
        return image
    }()
    private let uploadbtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Upload Photo", for: .normal)
        btn.addTarget(self, action: #selector(btn_upload), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    private let imagePicker: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = false
        return ip
    }()
    private let mySeg:UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.insertSegment(withTitle: "Pay", at: 0, animated: true)
        seg.insertSegment(withTitle: "Balance", at: 1, animated: true)
        seg.insertSegment(withTitle: "History", at: 2, animated: true)
        seg.insertSegment(withTitle: "Account", at: 3, animated: true)
        seg.selectedSegmentIndex = 0
        seg.addTarget(self, action: #selector(segClick), for: .valueChanged)
        return  seg
    }()
    private let SubView:UIView = {
        let sb = UIView()
        sb.backgroundColor = .white
        sb.isHidden = false
        return sb
    } ()
    private let paysubview:UIView = {
        let sb = UIView()
        sb.backgroundColor = .white
        sb.isHidden = false
        return sb
    } ()
    private let histroysubview:UIView = {
        let sb = UIView()
        sb.backgroundColor = .white
        sb.isHidden = false
        return sb
    } ()
    private let accsubview:UIView = {
        let sb = UIView()
        sb.backgroundColor = .white
        sb.isHidden = false
        return sb
    } ()
    private let mylabel:UILabel = {
        let label = UILabel()
        label.text = "Balance: 500"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.font = label.font.withSize(25)
        return label
    }()
    private let phno:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Phone Number"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let amt:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Amount"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let paybtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("Pay", for: .normal)
        btn.addTarget(self, action: #selector(btn_pay), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    private let myProcessView:UIProgressView = {
        let pview = UIProgressView()
        pview.setProgress(0.0, animated: true)
        pview.isHidden = true
        return pview
    }()
    private let pickerView = UIPickerView()
    private let data = ["Send Rahul         -249",
                        "Receive Kapil         +20",
                        "Receive Kapil        +209",
                        "Send Ravi        -100",
                        "Receive Kapil        +609",
                        "Send Ravi        -100",
                        "Receive Kapil        +29",
                        "Send Ravi        -180",
                        "Receive Kapil        +229",
                        "Send Ravi        -130",
                        "Receive Kapil        +89",
                        "Send Ravi        -10"
                        ]
    private let name:UITextField = {
        let textfield = UITextField()
        textfield.text = "Admin"
        textfield.textAlignment = .center
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.darkGray.cgColor
        textfield.layer.cornerRadius = 15.0
        return textfield
    }()
    private let myDate:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        //date.addTarget(self, action: #selector(dateCllick), for: .valueChanged)
        
        return date
    }()
    private let lblact:UILabel = {
        let label = UILabel()
        label.text = "Auto Payment:"
        
        label.backgroundColor = .white
        label.font = label.font.withSize(20)
        return label
    }()
    private let sw:UISwitch = {
        let s = UISwitch()
        s.backgroundColor = .white
        return s
    }()
    private let btnupdate:UIButton = {
        let btn = UIButton()
        btn.setTitle("Update", for: .normal)
        //btn.addTarget(self, action: #selector(btn_pay), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        tabBar.items = [item1,item2]
        return tabBar
    }()
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        view.addSubview(myImage)
        view.addSubview(uploadbtn)
        view.addSubview(mySeg)
        view.addSubview(SubView)
        view.addSubview(paysubview)
        view.addSubview(histroysubview)
        view.addSubview(accsubview)
        view.addSubview(tabBar)
        SubView.addSubview(mylabel)
        paysubview.addSubview(phno)
        paysubview.addSubview(amt)
        paysubview.addSubview(paybtn)
        paysubview.addSubview(myProcessView)
        histroysubview.addSubview(pickerView)
        accsubview.addSubview(name)
        accsubview.addSubview(myDate)
        accsubview.addSubview(lblact)
        accsubview.addSubview(sw)
        accsubview.addSubview(btnupdate)
        imagePicker.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
        // Do any additional setup after loading the view.
    }
    @objc func btn_upload()
    {
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker,animated: true)
        }
    }
    @objc func segClick()
    {
        
        if mySeg.selectedSegmentIndex==0
        {
            print("fgfgh")
            SubView.isHidden = true
            histroysubview.isHidden = true
            paysubview.isHidden = false
            accsubview.isHidden = true
        }
        else if mySeg.selectedSegmentIndex==1
        {
            print("fgf")
            paysubview.isHidden = true
            accsubview.isHidden = true
            histroysubview.isHidden = true
            SubView.isHidden = false
        }
        else if mySeg.selectedSegmentIndex==2
        {
            print("fgf")
            histroysubview.isHidden = false
            accsubview.isHidden = true
            paysubview.isHidden = true
            SubView.isHidden = true
        }
        else if mySeg.selectedSegmentIndex==3
        {
            print("fgf")
            accsubview.isHidden = false
            paysubview.isHidden = true
            SubView.isHidden = true
            histroysubview.isHidden = true
        }
    }
    @objc func btn_pay()
    {
        myProcessView.isHidden = false
        UIView.animate(withDuration: 5.0) {
            self.myProcessView.setProgress(1.0, animated: true)
            //myLabel.text = (String)myProcessView.progress ?? ""
            print(self.myProcessView.progress)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myImage.frame = CGRect(x: 80, y: 40, width: 80, height: 80)
        uploadbtn.frame = CGRect(x: myImage.right+10, y: 55, width: 120, height: 40)
        mySeg.frame = CGRect(x: 20, y: myImage.bottom + 40, width: view.width - 40, height: 50)
        SubView.frame =  CGRect(x: 20, y: mySeg.bottom  + 10 , width: view.width - 40, height: view.bottom - mySeg.bottom  - 20)
        paysubview.frame =  CGRect(x: 20, y: mySeg.bottom  + 10 , width: view.width - 40, height: view.bottom - mySeg.bottom  - 20)
        histroysubview.frame =  CGRect(x: 20, y: mySeg.bottom  + 10 , width: view.width - 40, height: view.bottom - mySeg.bottom  - 20)
        accsubview.frame =  CGRect(x: 20, y: mySeg.bottom  + 10 , width: view.width - 40, height: view.bottom - mySeg.bottom  - 20)
        mylabel.frame = CGRect(x:  10, y: 40, width: SubView.width - 20, height: 40)
        phno.frame = CGRect(x:  10, y: 20, width: paysubview.width - 20, height: 40)
        amt.frame = CGRect(x:  10, y: phno.bottom + 20, width: paysubview.width - 20, height: 40)
        myProcessView.frame = CGRect(x:  10, y: amt.bottom + 20, width: paysubview.width - 20, height: 20)
        paybtn.frame = CGRect(x:  10, y: amt.bottom + 30, width: paysubview.width - 20, height: 40)
        pickerView.frame = CGRect(x:  10, y: 10, width: histroysubview.width - 20, height: 200)
        name.frame = CGRect(x:  10, y: 20, width: accsubview.width - 20, height: 40)
        myDate.frame = CGRect(x: 10, y: name.bottom + 20, width: accsubview.width - 20, height: 40)
        lblact.frame = CGRect(x: 10, y: myDate.bottom + 20, width: 200, height: 40)
        sw.frame = CGRect(x: lblact.right, y: myDate.bottom + 20, width: 80, height: 40)
        btnupdate.frame = CGRect(x: 10, y: lblact.bottom + 20, width: accsubview.width - 20, height: 40)
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49.0
        tabBar.frame = CGRect(x: 0, y: view.frame.height - tabBarHeight, width: view.frame.width, height: tabBarHeight)
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
extension Screen3: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedimg = info[.originalImage] as? UIImage {
            myImage.image = selectedimg
        }
        picker.dismiss(animated: true)
    }
}
extension Screen3: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
            return data.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return data[row]
    }
    
    
}
