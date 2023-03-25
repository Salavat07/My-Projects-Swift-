//
//  LoginAssambly.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol LoginAssamblyProtocol: class {
    func configure(view: LoginView)

}

class LoginAssambly: LoginAssamblyProtocol {
    func configure(view: LoginView) {
        
        let presenter = LoginPresenter(view)
        let interactor = LoginInteractor(presenter)
        let router = LoginRouter(view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
