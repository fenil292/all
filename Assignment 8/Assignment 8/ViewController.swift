//
//  ViewController.swift
//  Tictactoevc
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sc1=0,sc2=0
    private let p1:UILabel = {
        let label = UILabel()
        label.text="Player 1:"
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .white
        return label
    }()
    private let p2:UILabel = {
        let label = UILabel()
        label.text="Player 2:"
        label.textColor = .black
        label.textAlignment = .right
        label.backgroundColor = .white
        return label
    }()
    private let p1_sc:UILabel = {
        let label = UILabel()
        label.text="0"
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .white
        return label
    }()
    private let p2_sc:UILabel = {
        let label = UILabel()
        label.text="0"
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .white
        return label
    }()
    private let turn:UILabel = {
        let label = UILabel()
        label.text="Player 1 Turn..."
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    
    private let winningCombinations = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
    private var zeroFlag = false
    private let myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 70, height: 70)
        //self.layout.layer.cornerRadius = 2.0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCollectionView)
        view.addSubview(p1)
        view.addSubview(p2)
        view.addSubview(p1_sc)
        view.addSubview(p2_sc)
        view.addSubview(turn)
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView.frame = CGRect(x: 0, y: 150, width: view.width, height: view.height - 300)
        p1.frame = CGRect(x: 60, y: myCollectionView.bottom + 10, width: 130, height: 30)
        p2.frame = CGRect(x: 60, y: p1.bottom + 10, width: 130, height: 30)
        p1_sc.frame = CGRect(x: p1.right+10, y: myCollectionView.bottom + 10, width: 130, height: 30)
        p2_sc.frame = CGRect(x: p2.right+10, y: p1.bottom + 10, width: 130, height: 30)
        turn.frame = CGRect(x: 0, y: myCollectionView.top - 50, width: view.width - 20, height: 20)
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    private func setupCollectionView() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setupCell(with: state[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            state.remove(at: indexPath.row)
            if zeroFlag {
                state.insert(0, at: indexPath.row)
                turn.text = "Player 1 Turn..."
            } else {
                state.insert(1, at: indexPath.row)
                turn.text = "Player 2 Turn..."
            }
            zeroFlag = !zeroFlag
            collectionView.reloadSections(IndexSet(integer: 0))
            checkWinner()
        }
    }
    private func checkWinner() {
        var alert = UIAlertController()
        /*if !state.contains(2) {
            resetstate()
            alert = UIAlertController(title: "Alert", message: "Draw...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert,animated: true,completion: nil)
            turn.text = "Player 1 Turn..."
        } else {*/
            for i in winningCombinations {
                //print(i[0])
                if state[i[0]] == state[i[1]] && state[i[1]] == state[i[2]] && state[i[2]] == state[i[3]] && state[i[0]] != 2 {
                    if(state[i[0]] == 1)
                    {
                        sc1 = sc1 + 1
                        p1_sc.text = "\(sc1)"
                        alert = UIAlertController(title: "Alert", message: "Player 1 Win...", preferredStyle: UIAlertController.Style.alert)
                    }
                    else if(state[i[0]] == 0)
                    {
                        sc2 = sc2 + 1
                        alert = UIAlertController(title: "Alert", message: "Player 2 Win...", preferredStyle: UIAlertController.Style.alert)
                        p2_sc.text = "\(sc2)"
                    }
                    turn.text = "Player 1 Turn..."
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert,animated: true,completion: nil)
                    resetstate()
                }
                else if !state.contains(2) {
                    
                    alert = UIAlertController(title: "Alert", message: "Draw...", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert,animated: true,completion: nil)
                    turn.text = "Player 1 Turn..."
                    resetstate()
                }
            //}
        }
    }
    private func resetstate() {
        state = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
        zeroFlag = false
        myCollectionView.reloadSections(IndexSet(integer: 0))
    }
}
