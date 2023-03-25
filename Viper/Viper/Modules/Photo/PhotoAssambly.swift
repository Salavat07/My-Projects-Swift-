//
//  PhotoAssambly.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import Foundation
 
protocol PhotoAssamblyProtocol: class {
  func configure(viewController: PhotoView)
}
 
class PhotoAssambly: PhotoAssamblyProtocol {
  func configure(viewController: PhotoView) {
    let presenter = PhotoPresenter(viewController)
    let interactor = PhotoInteractor(presenter)
    let router = PhotoRouter(viewController)
 
    viewController.presenter = presenter
    presenter.interactor = interactor
    presenter.router = router
  }
}
 
