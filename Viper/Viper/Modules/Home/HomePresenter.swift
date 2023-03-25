//
//  HomePresenter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol HomePresenterProtocol: class {
    
  func configureView()
  func logOutPressed()
  func showPhotoPressed()
 
  init(_ view: HomeViewProtocol)
}
 
class HomePresenter: HomePresenterProtocol {
 
  weak var view: HomeViewProtocol?
 
  var router: HomeRouterProtocol!
  var interactor: HomeInteractorProtocol!
 
  required init(_ view: HomeViewProtocol) {
    self.view = view
  }
 
  func configureView() {
    view?.setLogOutImage(image: interactor.loginImage)
    view?.setShowPhoto(image: interactor.showPhotoImage)
  }
 
  func logOutPressed() {
    router.closeCurrentController()
  }
 
  func showPhotoPressed() {
    router.showSecondController()
  }
}
