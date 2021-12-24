//
//  ViewController.swift
//  Ass9
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let imgpicker = UIImagePickerController()
    
    private let imgview :UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.backgroundColor = .gray
        imgview.clipsToBounds = true
        return imgview
    }()
    private let titlelabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Tap Below To select Image"
        label.textColor = #colorLiteral(red: 0, green: 0.4283069782, blue: 1, alpha: 1)
        label.font = UIFont.italicSystemFont(ofSize: 30)
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titlelabel)
        view.addSubview(imgview)
        imgpicker.delegate = self
        
        /*Tap Gestures*/
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tapg))
        tapgesture.numberOfTapsRequired = 1
        tapgesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapgesture)
        
        /*Pinch Gestures*/
        let pinchgesture = UIPinchGestureRecognizer(target: self, action: #selector(didpinch))
        view.addGestureRecognizer(pinchgesture)
        
        /*Rotate Gesture*/
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(didrotate))
        view.addGestureRecognizer(rotationGesture)
        
        /*Swipe Gesture*/
        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        leftswipe.direction = .left
        view.addGestureRecognizer(leftswipe)
        
        let rightswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        rightswipe.direction = .right
        view.addGestureRecognizer(rightswipe)
        
        let upswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        upswipe.direction = .up
        view.addGestureRecognizer(upswipe)
        
        let downswipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        downswipe.direction = .down
        view.addGestureRecognizer(downswipe)
        
        let panGestures = UIPanGestureRecognizer(target: self, action: #selector(didpanview))
        view.addGestureRecognizer(panGestures)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlelabel.frame = CGRect(x: 10, y: 50, width: view.width-20, height: 50)
        imgview.frame = CGRect(x: 70, y:170, width: 200, height: 200)
    }
}
extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let getimage = info[.originalImage] as? UIImage{
            imgview.image = getimage
        }
        imgpicker.dismiss(animated: true)
    }
    @objc private func tapg(gesture:UITapGestureRecognizer){
        imgpicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imgpicker, animated: true)
        }
    }
    @objc private func didSwipe(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .left{
            UIView.animate(withDuration: 0.5){
                self.imgview.frame = CGRect(x: self.imgview.frame.origin.x-40, y: self.imgview.frame.origin.y, width: 200, height: 200)
            }
        }else if gesture.direction == .right{
            UIView.animate(withDuration: 0.5){
                self.imgview.frame = CGRect(x: self.imgview.frame.origin.x+40, y: self.imgview.frame.origin.y, width: 200, height: 200)
            }
        }else if gesture.direction == .up{
            UIView.animate(withDuration: 0.5){
                self.imgview.frame = CGRect(x: self.imgview.frame.origin.x, y: self.imgview.frame.origin.y-40, width: 200, height: 200)
            }
        }else if gesture.direction == .down{
            UIView.animate(withDuration: 0.5){
                self.imgview.frame = CGRect(x: self.imgview.frame.origin.x, y: self.imgview.frame.origin.y+40, width: 200, height: 200)
            }
        }
    }
    @objc private func didpinch(gesture:UIPinchGestureRecognizer){
        imgview.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
    }
    @objc private func didrotate(gesture:UIRotationGestureRecognizer){
        imgview.transform = CGAffineTransform(rotationAngle: gesture.rotation)
    }
    
    @objc private func didpanview(gesture:UIPanGestureRecognizer){
        let x = gesture.location(in: view).x
        let y = gesture.location(in: view).y
        
        imgview.center = CGPoint(x: x, y: y)
    }
}
