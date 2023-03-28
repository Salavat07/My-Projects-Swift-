//
//  ViewController.swift
//  Circle_Game
//
//  Created by Salavat on 27.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let circlesCount = 7
    private var circles: [Circle] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateCircles()
    }
    
    private func generateCircles(){
        for i in 0...circlesCount - 1{
            let center = CGPoint(x: 30 + i * 30, y: 80 + 170 * (i % 4))
            let radius = CGFloat(30 + i * 4)
            let circle = Circle(center: center, radius: radius)
            circle.delegate = self
            view.addSubview(circle)
            circles.append(circle)
        }
    }
}

extension ViewController: CircleDelegate {
    func moved(_ circle:Circle) {
        intersectingCircles(with: circle).forEach { anotherCircle in
            circle.eat(anotherCircle)
        }
    }
    
    private func intersectingCircles(with circle: Circle) -> [Circle] {
        var answer = [Circle]()
        for anotherCircle in circles.filter { $0 !== circle } {
            if circle.intersects(with: anotherCircle) {
                answer.append(anotherCircle)
            }
        }
        return answer
    }
}

