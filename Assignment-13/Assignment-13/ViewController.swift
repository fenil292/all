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
    private let pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        ApiHandler.shared.getstates { states in
            print(self.states)
            self.states = states
            /*DispatchQueue.main.async {
                self.pickerView.reloadData()
            }*/
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pickerView.frame = CGRect(x:  20 , y: 200, width: view.width - 40, height: 300)
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
        //return states[row].state_name
        return states[row].state_name
        
    }
}
