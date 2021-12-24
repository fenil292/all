//
//  Notes.swift
//  Assignment-10
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Notes: UIViewController {
    private let myTable = UITableView()
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let item1 = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(add_note))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //let item2 = UIBarButtonItem(barButtonSystemItem: .camera, target:self, action: #selector(handleCamera))
        //let item3 = UIBarButtonItem(barButtonSystemItem: .add, target:self, action: #selector(handleAdd))
        toolBar.items = [space, item1,space]
        return toolBar
    }()
    private var notes = [Emp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //let temp = SqliteHandler.shared
        view.backgroundColor = .white
        view.addSubview(myTable)
        view.addSubview(toolBar)
        myTable.dataSource = self
        myTable.delegate = self
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "citycell")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //let toolBarHeight:CGFloat = view.safeAreaInsets.top + 20.0
        toolBar.frame = CGRect(x: 0, y: 20, width: view.width, height: 40)
        myTable.frame = CGRect(x: 0,y: toolBar.bottom + 10, width: view.frame.size.width,
                               height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        notes = SqliteHandler.shared.fetch()
        myTable.reloadData()
    }
    @objc func add_note()
    {
        let vc = NewNote()
        navigationController?.pushViewController(vc, animated: true)
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
extension Notes: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return notes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath)
            let emp = notes[indexPath.row]
        
            //cell.textLabel?.text = notes[indexPath.row].name
        cell.textLabel?.text = "\(emp.name) \t | \t \(emp.age) \t | \t \(emp.phone)"
            return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print([indexPath.row])
        let vc = NewNote()
        
        vc.emp = notes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let id = notes[indexPath.row].id
        SqliteHandler.shared.delete(for: id) { (success) in
            if success {
                print("Deleted in VC")
                self.notes.remove(at: indexPath.row)
                self.myTable.deleteRows(at: [indexPath], with: .automatic)
            } else {
                print("not Deleted in VC")
            }
        }
    }
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     if section == 0 {
     return CGRect(x: 0,y: 0, width: view.frame.size.width,
     height: 100)
     }
     }*/
}

