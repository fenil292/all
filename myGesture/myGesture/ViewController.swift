//
//  ViewController.swift
//  myGesture
//
//  Created by DCS on 03/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myView:UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        view.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        /*let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didtapview))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 2
        myView.addGestureRecognizer(tapGesture)*/
        
        //pinch
        /*let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didpinchview))
        view.addGestureRecognizer(pinchGesture)*/
        
        //rotaion
        /*let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didrotateview))
        view.addGestureRecognizer(rotationGesture)*/
        
        //swipe
        /*let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didswipeview))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didswipeview))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didswipeview))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didswipeview))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)*/
        
        //pan
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didpanview))
        view.addGestureRecognizer(panGesture)
        
    }
}
extension ViewController {
    /*@objc private func didtapview(gesture: UITapGestureRecognizer)
    {
        print("Location: \(gesture.location(in: myView))") // (in: view)
    }*/
    /*@objc private func didpinchview(gesture: UIPinchGestureRecognizer) {
        myView.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }*/
    /*@objc private func didrotateview(gesture: UIRotationGestureRecognizer) {
        myView.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    }*/
    /*@objc private func didswipeview(gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            UIView.animate(withDuration: 0.9, animations: {
                    self.myView.frame = CGRect(x: self.myView.frame.origin.x - 40, y: self.myView.frame.origin.y, width: 200, height: 200)
            })
        }
        else if gesture.direction == .right {
            myView.frame = CGRect(x: myView.frame.origin.x + 40, y: myView.frame.origin.y, width: 200, height: 200)
        }
        else if gesture.direction == .up {
            myView.frame = CGRect(x: myView.frame.origin.x, y: myView.frame.origin.y - 40, width: 200, height: 200)
        }
        else if gesture.direction == .down {
            myView.frame = CGRect(x: myView.frame.origin.x, y: myView.frame.origin.y + 40, width: 200, height: 200)
        }
    }*/
    @objc private func didpanview(gesture: UIPanGestureRecognizer) {
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        myView.center = CGPoint(x: x, y: y)
    }
}
