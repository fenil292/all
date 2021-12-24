//
//  ViewController.swift
//  Mycollectionview
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myCollectionView = UICollectionView()
    private var cityarr = ["Surat","Vapi","Valsad","Navsari","Vadodara"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Collection View"
        view.addSubview(myCollectionView)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView.frame = CGRect(x:0,
                                        y: view.safeAreaInsets.top,
                                        width: view.width,
                                        height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
                                        )
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    private func setupTableView() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(ViewController.self, forCellWithReuseIdentifier: "CityCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath as IndexPath)
    }
    
    
}
