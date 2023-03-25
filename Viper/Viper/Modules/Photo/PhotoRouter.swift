//
//  PhotoRouter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//
import UIKit
 
protocol PhotoRouterProtocol: class {
  init (_ viewController: PhotoView)
  func backToHome()
}
 
class PhotoRouter: PhotoRouterProtocol {
  weak var viewController: PhotoView?
 
  required init(_ viewController: PhotoView) {
    self.viewController = viewController
  }
 
  func backToHome() {
    viewController?.dismiss(animated: true, completion: nil)
  }
 
}
 
