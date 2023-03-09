//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Salavat on 04.03.2023.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mixingGesture = MixGesture(target: self, action: #selector(handleMixing))
        mixingGesture.delegate = self
        blueView.addGestureRecognizer(mixingGesture)
    }
    
    
    @objc func handleMixing(_ gesture: MixGesture){
        let orangeViewX = orangeView.frame.minX
        let orangeViewY = orangeView.frame.minY
        let orangeViewWidth = orangeView.frame.width
        let orangeViewHeight = orangeView.frame.height
        
        orangeView.frame = CGRect(x: orangeViewX,
                                  y: orangeViewY,
                                  width: orangeViewWidth - 30,
                                  height: orangeViewHeight)
    }
    
    
    @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
        
        let blueViewFrame = blueView.frame
        let orangeViewFrame = orangeView.frame
        
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view
            else {
                return
            }
        
          gestureView.center = CGPoint(
          x: gestureView.center.x + gestureTranslation.x,
          y: gestureView.center.y + gestureTranslation.y
          )
          
          gesture.setTranslation(.zero, in: view)
          
          guard gesture.state == .ended
              else{
              return
          }
        print("Blue view panned")
        
        for value in Int(orangeViewFrame.minY)...Int(orangeViewFrame.maxY){
            if Int(blueViewFrame.origin.y) == value{
                blueView.isHidden = true
            }
        }
    }
        
    @IBAction func redPanAction(_ gesture: UIPanGestureRecognizer) {
        
        let redViewFrame = redView.frame
        let orangeViewFrame = orangeView.frame
        
        let gestureTranslation = gesture.translation(in: view)
        guard let gestureView = gesture.view
        else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended
        else{
            return
        }
        print("Red view panned")
        
        for value in Int(orangeViewFrame.minY)...Int(orangeViewFrame.maxY){
            if Int(redViewFrame.origin.y) == value{
                redView.isHidden = true
            }
        }
    }
    
}

