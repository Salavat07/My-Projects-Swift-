//
//  ViewController.swift
//  CALayout
//
//  Created by Salavat on 11.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
//        someView.layer.cornerRadius = 15
//        // 1. Смещение тени относительно someView
//        someView.layer.shadowOffset = CGSize(width: 3, height: 4)
//        // 2. Непрозрачность тени
//        someView.layer.shadowOpacity = 0.4
//        // 3. Радиус тени
//        someView.layer.shadowRadius = 10
//        // 4. Цвет тени
//        someView.layer.shadowColor = UIColor.gray.cgColor
//
//        someView.layer.borderColor = UIColor.gray.cgColor    //    1. Цвет обводки
//        someView.layer.borderWidth = 2    //    2. Ширина линии обводки
//        someView.layer.shadowOffset = CGSize(width: 3, height: 4) //    3. Смещение тени относительно someView
//        someView.layer.shadowOpacity = 0.4    // 4. Непрозрачность тени
//        someView.layer.shadowRadius = 10    // 5. Радиус тени
//        someView.layer.shadowColor = UIColor.gray.cgColor     // 6. Цвет тени
//
//        let animation = CABasicAnimation(keyPath: "position")
//        animation.fromValue = view.center
//        animation.toValue = CGPoint(x: 100.0, y: 100.0)
//        animation.duration = 3.0
//        animation.autoreverses = true
//        animation.repeatCount = 2
//        someView.layer.add(animation, forKey: "animatePosition")
//
//        let animaton = CABasicAnimation(keyPath: "opacity")
//        animaton.fromValue = 1
//        animaton.toValue = 0
//        animaton.duration = 1
//        animaton.autoreverses = true
//        someView.layer.add(animaton, forKey: "changeOpacity")
//
//        let size = CABasicAnimation(keyPath: "transform.scale.x")
//        size.fromValue = 1
//        size.toValue = 2
//        size.duration = 1.0
//        size.repeatCount = 3
//        size.autoreverses = true
//        someView.layer.add(size, forKey: "changeХScale")
        
        // Пружжиная анимация 
         UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                    self.someView.center.x += 50
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

