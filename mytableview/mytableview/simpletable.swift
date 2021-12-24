//
//  simpletable.swift
//  mytableview
//
//  Created by DCS on 29/10/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class simpletable: UIViewController {
    private let myTable = UITableView()
    
    private var city = ["Surat", "Navsari", "Mumbai", "Bhopal", "Delhi", "Kolkta", "Navsari", "Mumbai", "Bhopal", "Delhi", "Kolkta", "Navsari", "Mumbai", "Bhopal", "Delhi", "Kolkta", "Navsari", "Mumbai", "Bhopal", "Delhi", "Kolkta", "Navsari", "Mumbai", "Bhopal", "Delhi", "Kolkta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Table View"
        view.addSubview(myTable)
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "citycell")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTable.frame = CGRect(x: 0,y: view.safeAreaInsets.top, width: view.frame.size.width,
        height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
}
extension simpletable: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return city.count
        } else {
            return city.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath)
            cell.textLabel?.text = city[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath)
            cell.textLabel?.text = city[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(city[indexPath.row])
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Section 1"
        } else {
            return "Section 2"
        }
    }
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGRect(x: 0,y: 0, width: view.frame.size.width,
                   height: 100)
        }
    }*/
}
