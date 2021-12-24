//
//  Screen2.swift
//  Ass7
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen2: UIViewController {
    private let mytableview = UITableView()
    private let breakfastdata = ["Breakfast","Burger","Pizza","Breakfast","Burger","Pizza"]
    private let desc = ["Breakfast is the first meal of a day, most often eaten in the early morning before work","burger will drip if it's big enough and served right off the griddle or grill","Pizza could come from the Greek word “pitta” meaning “pie”, or the Langobardic word","Breakfast is the first meal of a day, most often eaten in the early morning before work","burger will drip if it's big enough and served right off the griddle or grill","Pizza could come from the Greek word “pitta” meaning “pie”, or the Langobardic word"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title="Table Views"
        view.addSubview(mytableview)
        setuptable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mytableview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top
            - view.safeAreaInsets.bottom)
    }
}
extension Screen2:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breakfastdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodCell
        cell.setupBreakfastCellWiths(title:breakfastdata[indexPath.row],title:desc[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clickdata(a: breakfastdata[indexPath.row])
    }
    
    @objc func clickdata(a:String){
        UserDefaults.standard.setValue(a, forKey: "Topic")
        self.dismiss(animated: true)
        let sc3 = Screen3()
        navigationController?.pushViewController(sc3, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    private func setuptable(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(FoodCell.self, forCellReuseIdentifier: "cell")
    }
}
