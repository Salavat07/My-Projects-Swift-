//
//  HomeRouter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit


protocol HomeRouterProtocol: class {
  init(_ viewController: HomeView)
  func closeCurrentController()
  func showSecondController()
}

class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: HomeView?
    required init(_ viewController: HomeView) {
        self.viewController = viewController
    }
 
    func closeCurrentController() {
        viewController?.dismiss(animated: true, completion: nil)
      }

    func showSecondController() {
        viewController?.performSegue(withIdentifier: viewController!.sequeIdentifire, sender: nil)
      }
   

}
