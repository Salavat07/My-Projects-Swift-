//
//  ProgressBar.swift
//  CustomProgressBar
//
//  Created by Salavat on 26.03.2023.
//

import Foundation
import UIKit


@IBDesignable
class ProgressBar: UIView{
    
    @IBInspectable
    var totalComponents: UInt = 5
    
    @IBInspectable
    var filledComponents: UInt = 0
    
    @IBInspectable
    var cornerRadius: CGFloat = 5
    
    @IBInspectable
    var filledColour: UIColor = .purple
    
    @IBInspectable
    var unfilledColour: UIColor = .purple.withAlphaComponent(0.3)
    
    @IBInspectable
    var spacing: CGFloat = 4
    
    override func layoutSubviews() {
        super.layoutSubviews()
        render()
    }
    
    func render(){
        subviews.forEach{$0.removeFromSuperview()}
        
        let viewWidth: CGFloat = (frame.size.width) - (spacing * (CGFloat(totalComponents - 1))) / CGFloat(totalComponents)
        let viewHeight: CGFloat = frame.size.height
         
        var dx: CGFloat = 0
        for i in 0..<totalComponents {
            let component = UIView(frame: CGRect(x: dx, y: 0, width: viewWidth, height: viewHeight))
            dx += spacing + viewWidth
            addSubview(component)
            component.backgroundColor = i < filledComponents ? filledColour : unfilledColour
            component.layer.cornerRadius = cornerRadius
        }
    }
}
