//
//  BreakfastCell.swift
//  Ass7
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    private let myimageview:UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.backgroundColor = .red
        return imageview
    }()
    
    private let mydata:UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.font = UIFont(name: "Optima-BoldItalic", size: 18)
        label.numberOfLines = 8
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //label.backgroundColor = .red
        return label
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize : 28)
        //label.backgroundColor = .green
        return label
    }()
    
    func setupBreakfastCellWiths(title name:String,title data:String){
        contentView.addSubview(myimageview)
        contentView.addSubview(myLabel)
        contentView.addSubview(mydata)
        
        myimageview.frame = CGRect(x: 20, y: 20, width: 120, height: 120)
        myLabel.frame = CGRect(x: myimageview.right+20, y: 20, width: 200, height: 30)
        mydata.frame = CGRect(x: myimageview.frame.origin.x+140, y: myLabel.bottom, width: 200, height: 100)
        myimageview.image = UIImage(named: name)
        myLabel.text = name
        mydata.text = data
    }
}
