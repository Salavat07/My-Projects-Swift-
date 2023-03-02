//
//  Cell.swift
//  MyImageCollection
//
//  Created by Salavat on 26.02.2023.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temparetureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    func setSmileImage (smileName:String){
        smileImage.image = UIImage(named: smileName)
    }
    
    func setTemparetureImage (tempName:String){
        temparetureImage.image = UIImage(named: tempName)
        
    }
}
