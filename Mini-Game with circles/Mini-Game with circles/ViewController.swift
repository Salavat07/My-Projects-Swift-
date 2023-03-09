//
//  ViewController.swift
//  Mini-Game with circles
//
//  Created by Salavat on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.addCircles()
    }

    func addCircles() {
        for i in 1...7 {
            let circleXIB = UINib(nibName: "CircleView\(i)", bundle: nil)
            let circle = circleXIB.instantiate(withOwner: self, options: nil).first as! CircleView
            circle.tag = i
            circle.isUserInteractionEnabled = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            circle.addGestureRecognizer(panGesture)
            self.view.addSubview(circle)
        }
    }
    var draggedCircle: CircleView?

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let circle = gesture.view as! CircleView
        switch gesture.state {
        case .began:
            self.draggedCircle = circle
        case .changed:
            let translation = gesture.translation(in: self.view)
            circle.center = CGPoint(x: circle.center.x + translation.x, y: circle.center.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            if let targetCircle = self.view.subviews.filter({ $0 is CircleView && $0 != self.draggedCircle }).first(where: { circle.frame.intersects($0.frame) && ($0 as! CircleView).tag == circle.tag }) as? CircleView {
                targetCircle.toggleColor()
                targetCircle.frame = CGRect(x: targetCircle.frame.origin.x, y: targetCircle.frame.origin.y, width: targetCircle.frame.width + 20, height: targetCircle.frame.height + 20)
                self.draggedCircle?.removeFromSuperview()
                self.draggedCircle = nil
            } else {
                UIView.animate(withDuration: 0.3) {
                    circle.center = CGPoint(x: CGFloat(circle.tag - 1) * 100 + 50, y: 300)
                }
            }
        default:
            break
        }
    }


}
class CircleView: UIView {
    var isDarkGray = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleColor() {
        if !isDarkGray {
            self.backgroundColor = UIColor.darkGray
            self.isDarkGray = true
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } else {
            self.backgroundColor = UIColor.blue
            self.isDarkGray = false
            self.transform = CGAffineTransform.identity
        }
    }
}


