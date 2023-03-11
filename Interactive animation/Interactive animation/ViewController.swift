//
//  ViewController.swift
//  Interactive animation
//
//  Created by Salavat on 11.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var someView: UIView!
    
    @objc func dragView(recognizer: UIPanGestureRecognizer){
        let state = recognizer.state
        if state == .changed{
            let translation = recognizer.translation(in: self.view)
            let newX = someView.center.x + translation.x
            let newY = someView.center.y + translation.y
            someView.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            someView.backgroundColor = .green
        }
        if state == .ended{
            UIView.animate(withDuration: 0, delay: 0.25, animations: {
                self.someView.center = self.view.center
                self.someView.backgroundColor = .red
                })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragView))
        someView.addGestureRecognizer(panGestureRecognizer)
        someView.layer.cornerRadius = 30
        
    }
     override func viewDidAppear(_ animated: Bool){
        someView.layer.shadowOffset = CGSize(width: 5, height: 8)
        someView.layer.shadowOpacity = 0.8
        someView.layer.shadowRadius = 10
        someView.layer.shadowColor = UIColor.black.cgColor
    }

}

