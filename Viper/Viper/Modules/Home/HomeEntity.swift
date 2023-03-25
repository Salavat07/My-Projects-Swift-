//
//  HomeEntity.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol HomeEntityProtocol {
    var logoutImage:UIImage {get}
    var showPhotoImage:UIImage {get}

}
 
struct HomeEntity: HomeEntityProtocol {
    var logoutImage = UIImage(imageLiteralResourceName: "logout")
    
    var showPhotoImage = UIImage(imageLiteralResourceName: "showImage")
    
}
 
