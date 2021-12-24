//
//  Screen3.swift
//  Ass7
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Screen3: UIViewController {
    private let myimageview:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Recipe"
        label.textColor = .green
        label.font = UIFont.italicSystemFont(ofSize: 50)
        label.font = UIFont(name: "Optima", size: 50)
        return label
    }()
    private let mydata:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 20)
        label.font = UIFont(name: "Optima", size: 20)
        label.numberOfLines = 6
        
        return label
    }()
    private let btnorder:UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        
        button.tintColor = .white
        button.backgroundColor = .green
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 3)
        button.layer.shadowOpacity = 0.7
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titlelabel)
        view.addSubview(mydata)
        view.addSubview(myimageview)
        view.addSubview(btnorder)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let mytitle = UserDefaults.standard.string(forKey: "Topic"){
            titlelabel.text = mytitle
            myimageview.image = UIImage(named: mytitle)
        }
        myimageview.frame = CGRect(x: 0, y: 100, width: view.width, height: 300)
        titlelabel.frame = CGRect(x: 90, y: 20, width: 200, height: 100)
        mydata.frame = CGRect(x: 10, y: myimageview.bottom+10, width: view.width-20, height: 180)
        btnorder.frame = CGRect(x: 10, y: mydata.bottom + 10, width: view.width-20, height: 50)
        mydata.text = "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with"
    }
}
