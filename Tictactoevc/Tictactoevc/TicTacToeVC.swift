//
//  ViewController.swift
//  Tictactoevc
//
//  Created by DCS on 26/11/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    private var state = [2,2,2,
                         2,2,2,
                         2,2,2]
    
    private let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    private var zeroFlag = false
    private let myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCollectionView)
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView.frame = view.bounds
    }
}
extension TicTacToeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    private func setupCollectionView() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
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
            } else {
                state.insert(1, at: indexPath.row)
            }
            zeroFlag = !zeroFlag
            collectionView.reloadSections(IndexSet(integer: 0))
            checkWinner()
        }
    }
    private func checkWinner() {
        if !state.contains(2) {
            print("Draw")
            resetstate()
        } else {
            for i in winningCombinations {
                print(i[0])
                if state[i[0]] == state[i[1]] && state[i[1]] == state[i[2]] && state[i[0]] != 2 {
                    resetstate()
                    print("\(state[i[0]]) won")
                    break
                }
            }
        }
    }
    private func resetstate() {
        state = [2,2,2,2,2,2,2,2,2]
        zeroFlag = false
        myCollectionView.reloadSections(IndexSet(integer: 0))
    }
}
