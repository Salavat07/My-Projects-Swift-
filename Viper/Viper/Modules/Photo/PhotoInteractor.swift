//
//  PhotoInteractor.swift
//  Viper
//

import UIKit
 
protocol PhotoInteractorProtocol: class {
  init(_ presenter: PhotoPresenterProtocol)
 
  var photoImage: UIImage { get }
}
 
class PhotoInteractor: PhotoInteractorProtocol {
 
  weak var presenter: PhotoPresenterProtocol?
 
  let entityProtocol: PhotoEntityProtocol = PhotoEntity()
 
  required init (_ presenter: PhotoPresenterProtocol) {
    self.presenter = presenter
  }
 
  var photoImage: UIImage {
    get {
      return entityProtocol.photo
    }
  }
 
}
 
