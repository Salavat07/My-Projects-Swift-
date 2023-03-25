//
//  LoginEntity.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol LoginEntityProtocol{
    var logInImageForButton: UIImage{ get }
}

struct LoginEntity: LoginEntityProtocol{

  
    var logInImageForButton = UIImage(imageLiteralResourceName: "Login")


}
