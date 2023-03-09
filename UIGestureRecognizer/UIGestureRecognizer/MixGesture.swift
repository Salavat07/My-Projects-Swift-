//
//  MixGesture.swift
//  UIGestureRecognizer
//
//  Created by Salavat on 04.03.2023.
//

import UIKit

class MixGesture: UIGestureRecognizer {
    
    var mixingNumber = 0
    var mixingStartPoint: CGPoint = .zero
    var finalDirection: MixingGestureDirection = .undefined
    
    let requiredMovements = 2
    let distanceForMixGestures: CGFloat = 35
    
    enum MixingGestureDirection{
        case left
        case right
        case undefined
    }
    
    override func reset() {
        mixingNumber = 0
        mixingStartPoint = .zero
        finalDirection = .undefined
        
        if state == .possible{
            state = .failed
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        guard let touch = touches.first else{
            return
        }
        mixingStartPoint = touch.location(in: view)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        guard let touch = touches.first else{
            return
        }
        let mixingLocation = touch.location(in: view)
        
        let horizontalDifference = mixingLocation.x - mixingStartPoint.x
        
        let direction:MixingGestureDirection
        
        if abs(horizontalDifference) < CGFloat(distanceForMixGestures){
            return
        }
        if horizontalDifference < 0{
            direction = .left
        }else {
            direction = .right
        }
        
        if finalDirection == .undefined || (finalDirection == .left && direction == .right) || (finalDirection == .right && direction == .left) {
            
            mixingStartPoint = mixingLocation
            finalDirection = direction
            mixingNumber += 1
        }
        
        if state == .possible && mixingNumber > requiredMovements {
            state = .ended
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        reset()
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        reset()
    }
}
