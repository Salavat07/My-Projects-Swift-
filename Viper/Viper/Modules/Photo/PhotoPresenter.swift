//
//  PhotoPresenter.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import Foundation

protocol PhotoPresenterProtocol: class {
 init (_ view: PhotoViewProtocol)

 func configureView()
 func backToHomePressed()
}

class PhotoPresenter: PhotoPresenterProtocol {

 weak var view:PhotoViewProtocol?

 var interactor: PhotoInteractorProtocol!
 var router: PhotoRouterProtocol!

 required init(_ view: PhotoViewProtocol) {
   self.view = view
 }

 func configureView() {
   view?.setPhoto(image: interactor.photoImage)
 }

 func backToHomePressed() {
   router.backToHome()
 }


}
