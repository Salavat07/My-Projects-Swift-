//
//  PhotoEntity.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//
import UIKit
 
protocol PhotoEntityProtocol {
  var photo: UIImage { get }
}
 
struct PhotoEntity: PhotoEntityProtocol {
  var photo = UIImage(imageLiteralResourceName: "female")
  }

 
