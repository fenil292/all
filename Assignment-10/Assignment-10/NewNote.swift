//
//  NewNoteVC.swift
//  myFileManager
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class NewNote: UIViewController {
    var emp:Emp?
    let temp = SqliteHandler.shared
    private let nameTextField:UITextField = {
        let textFiled = UITextField()
        textFiled.textColor = .black
        textFiled.placeholder = "Enter Name"
        textFiled.textAlignment = .center
        textFiled.backgroundColor = .white
        
        textFiled.layer.borderWidth = 1
        return textFiled
    }()
    private let nameTextField2:UITextField = {
        let textFiled = UITextField()
        textFiled.textColor = .black
        textFiled.placeholder = "Enter Age"
        textFiled.textAlignment = .center
        textFiled.backgroundColor = .white
        
        textFiled.layer.borderWidth = 1
        return textFiled
    }()
    private let nameTextField3:UITextField = {
        let textFiled = UITextField()
        textFiled.textColor = .black
        textFiled.placeholder = "Enter Phone no"
        textFiled.textAlignment = .center
        textFiled.backgroundColor = .white
        
        textFiled.layer.borderWidth = 1
        return textFiled
    }()
    /*private let contentTextView:UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = .systemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.backgroundColor = .lightGray
        return textView
    }()*/
    
    private let saveButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(saveNote), for: .touchUpInside)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    /*private let deleteButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Delete", for: .normal)
        btn.addTarget(self, action: #selector(deleteNote), for: .touchUpInside)
        btn.backgroundColor = .red
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(nameTextField2)
        view.addSubview(nameTextField3)
        //view.addSubview(contentTextView)
        view.addSubview(saveButton)
        navigationController?.setNavigationBarHidden(false, animated: false)
        //view.addSubview(deleteButton)
        // Do any additional setup after loading the view.
        if let d = emp {
            nameTextField.text = d.name
            nameTextField2.text = String(d.age)
            nameTextField3.text = d.phone
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField.frame = CGRect(x: 40, y: 100, width: view.width - 80, height: 40)
        nameTextField2.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 40)
        nameTextField3.frame = CGRect(x: 40, y: nameTextField2.bottom + 20, width: view.width - 80, height: 40)
        //contentTextView.frame = CGRect(x: 40, y: nameTextField.bottom + 20, width: view.width - 80, height: 300)
        saveButton.frame = CGRect(x: 40, y: nameTextField3.bottom + 20, width: view.width - 80, height: 40)
        //deleteButton.frame = CGRect(x: 40, y: saveButton.bottom + 20, width: view.width - 80, height: 40)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*do {
            let filepath = FileManagerService.getDocDir().appendingPathComponent("Ttt.txt")
            let fetchedContent = try String(contentsOf: filepath)
            print(fetchedContent)
            contentTextView.text = fetchedContent
        } catch {
            print(error)
        }*/
        
    }
    
    @objc private func saveNote()
    {
        /*let name = nameTextField.text!
        let content = contentTextView.text!
        let filePath = FileManagerService.getDocDir().appendingPathComponent("\(name).txt")
        do {
            try content.write(to: filePath, atomically: true, encoding: .utf8)
        } catch {
            print(error)
        }*/
        let name = nameTextField.text!
        let age = Int(nameTextField2.text!)!
        let phone = nameTextField3.text!
        if let e = emp {
            let updateEmp = Emp(id: e.id, name: name, age: age, phone: phone)
            print("UPDATE \(updateEmp)")
            //temp.insert(e: updateEmp, completion: nil)
            update(emp: updateEmp)
            
        } else {
            print("INSERT \(name), \(age), \(phone)")
            let insemp = Emp(id: 0, name: name, age: age, phone: phone)
            insert(emp: insemp)
        }
    }
    private func insert(emp:Emp) {
        SqliteHandler.shared.insert(e: emp) { (success) in
            if success {
                print("Insert successfull, recevied mesage at VC")
                self.resetfields()
            } else {
                print("Insert failed, recevied mesage at VC")
            }
        }
    }
    private func update(emp:Emp) {
        SqliteHandler.shared.update(e: emp) { (success) in
            if success {
                print("Update successfull, recevied mesage at VC")
                self.resetfields()
            } else {
                print("Update failed, recevied mesage at VC")
            }
        }
    }
    private func resetfields()
    {
        emp = nil
        nameTextField.text = ""
        nameTextField2.text = ""
        nameTextField3.text = ""
    }
}
