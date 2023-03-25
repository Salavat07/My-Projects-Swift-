//
//  LoginInteractor.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol LoginInteractorProtocol: class {
    init(_ presenter: LoginPresenterProtocol)
    var login: UIImage { get }
}

class LoginInteractor: LoginInteractorProtocol {
    
    weak var presenter: LoginPresenterProtocol?
    
    required init(_ presenter: LoginPresenterProtocol) {
        self.presenter = presenter
      }

    let loginEntity: LoginEntityProtocol = LoginEntity() as LoginEntityProtocol
    
    var login: UIImage {
        get { return loginEntity.logInImageForButton}
    }
}
