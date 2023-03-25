//
//  LoginRouter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol LoginRouterProtocol: class {
    func openHomePage()
    init (_ viewController: LoginView)
}

class LoginRouter: LoginRouterProtocol {

    weak var viewController: LoginView?

    required init(_ viewController: LoginView) {
        self.viewController = viewController
      }
    
    func openHomePage() {
        viewController?.performSegue(withIdentifier: viewController!.segueIdentifier, sender: nil)
       }
 

}
