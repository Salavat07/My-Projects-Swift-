//
//  Circle.swift
//  Circle_Game
//
//  Created by Salavat on 27.03.2023.
//

import Foundation
import UIKit

protocol CircleDelegate: class {
    func moved (_ circle:Circle)
}

class Circle: UIView{
    
    let radius: CGFloat
    
    private let red: CGFloat = 50 / 255.0
    private let green: CGFloat
    private let blue: CGFloat = 168 / 255.0

    private var lastLocation: CGPoint = .zero
    
    weak var delegate: CircleDelegate?
    
    init(center: CGPoint, radius: CGFloat) {
        let greenRange = (52...160)
        let green: CGFloat = CGFloat(greenRange.randomElement()!) / 255.0
        self.green = green
        self.radius = radius
        
        let width = radius * 2
        let size = CGSize(width: width, height: width)
        
        super.init(frame: CGRect(origin: center, size: size))
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(detectPan))
        addGestureRecognizer(panRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been inplemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        layer.cornerRadius = frame.height / 2
    }
    
    func intersects(with anotherCircle:Circle) ->  Bool {
        let distanceBetweenCenters = sqrt((center.x - anotherCircle.center.x).squared + (center.y - anotherCircle.center.y).squared)
        return distanceBetweenCenters < self.frame.width / 2 + anotherCircle.frame.width / 2
    }
    
    func eat(_ anotherCircle: Circle) {
        if self.frame.size.width < anotherCircle.frame.size.width {
            anotherCircle.eat(self)
            return
        }
        UIView.animate(withDuration: 0.5) {
            
            self.backgroundColor = UIColor(
                red: self.red,
                green: self.green + anotherCircle.green / 2,
                blue: self.blue,
                alpha: 1.0)
            
            let scaleFactor: CGFloat = 1.2
            self.frame.size = CGSize(width: self.frame.width * scaleFactor, height: self.frame.height * scaleFactor)
            self.center.x -= self.frame.width * (scaleFactor - 1) / 2
            self.center.y -= self.frame.width * (scaleFactor - 1) / 2
            self.layoutIfNeeded()
            anotherCircle.alpha = 0
        }
    completion: { _ in
        anotherCircle.removeFromSuperview()
    }
}
    @objc private func detectPan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: superview)
        center = CGPoint(
            x: lastLocation.x + translation.x,
            y: lastLocation.y + translation.y
        )
        
        if recognizer.state == .ended{
            delegate?.moved(self)
        }
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubviewToFront(self)
        lastLocation = center
    }
}

extension CGFloat {
    var squared: CGFloat{
        self * self
    }
}
