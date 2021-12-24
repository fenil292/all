//
//  CollectionViewCell.swift
//  Tictactoevc
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    private let myImage:UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    func setupCell(with status:Int) {
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(myImage)
        myImage.frame = CGRect(x:10, y:10, width: 50, height: 50)
        let name = status == 0 ? "o" : status == 1 ? "x" : ""
        myImage.image = UIImage(named: name)
    }
}
