//
//  ViewController.swift
//  Assignment-13
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var states = [State]()
    var t = ["gfg","fgr"]
    private let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pickerView.frame = CGRect(x:  20 , y: 200, width: view.width - 40, height: 300)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ApiHandler.shared.getstates { st in
            //print(self.states.state_name)
            
            self.states = st.states
            print(self.states[0].state_name)
            print(self.states.count)
            
            
            /*DispatchQueue.main.async {
             self.pickerView.reloadData()
             }*/
        }
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
    }
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row].state_name
        //return t[row]
        
    }
}
