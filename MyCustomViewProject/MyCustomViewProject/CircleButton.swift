//
//  CircleButton.swift
//  MyCustomViewProject
//
//  Created by Salavat on 28.02.2023.
//

import UIKit

@IBDesignable class CircleButton: UIButton {

    override func prepareForInterfaceBuilder(){
        if roundButton {
          layer.cornerRadius = frame.height / 2
        }
    }
    
    @IBInspectable var roundButton: Bool = false{
        didSet{
            if roundButton {
              layer.cornerRadius = frame.size.width / 2
            }
        }
    }
    
    
}
