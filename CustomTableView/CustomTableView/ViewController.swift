//
//  ViewController.swift
//  CustomTableView
//
//  Created by DCS on 01/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myTableview = UITableView()
    private var cityArray = ["Surat","Vapi","Rajkot","Vadodara","Valsad","Navsari"]
    private let mySearch = UISearchBar()
    private var searching = false
    private var searchData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Custom Table View"
        setupTableView()
        view.addSubview(myTableview)
        view.addSubview(mySearch)
        mySearch.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mySearch.frame = CGRect(x:0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        myTableview.frame = CGRect(x: 0, y: mySearch.bottom, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchData.count
        } else {
            return cityArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        if searching {
            
            cell.textLabel?.text = searchData[indexPath.row]
            
        } else {
            
            cell.textLabel?.text = cityArray[indexPath.row]
            
        }
        return cell
    }
    
    private func setupTableView() {
        myTableview.dataSource = self
        myTableview.delegate = self
        myTableview.register(UITableViewCell.self, forCellReuseIdentifier: "CityCell")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var alert
    }
}
extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
        }
        else
        {
            searching = true
            searchData = cityArray.filter({$0.lowercased().hasPrefix(searchText.lowercased())})
        }
        myTableview.reloadData()
    }
}
