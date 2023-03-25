//
//  LoginPresenter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import Foundation

protocol LoginPresenterProtocol: class{
    
    init(_ view: LoginViewProtocol)

    func configureView()
    func loginPressed()

}

class LoginPresenter: LoginPresenterProtocol {

    weak var view: LoginViewProtocol?
    required init(_ view: LoginViewProtocol) {
       self.view = view
     }

    var router: LoginRouterProtocol!
        
    var interactor: LoginInteractorProtocol!

    func configureView() {
        view?.setLoginbuttonImage(image: interactor.login)
      }

    func loginPressed() {
        router.openHomePage()
    }
}
