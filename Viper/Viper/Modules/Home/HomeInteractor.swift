//
//  HomeInteractor.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol HomeInteractorProtocol: class {
    
    init(_ presenter: HomePresenter)
    var loginImage: UIImage { get }
    var showPhotoImage: UIImage { get }
}

class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomePresenterProtocol?

    let homeEntity: HomeEntityProtocol = HomeEntity()
    
    required init(_ presenter: HomePresenter) {
        self.presenter = presenter
      }
    var loginImage: UIImage {
        get { return  homeEntity.logoutImage}
    }
    var showPhotoImage: UIImage {
        get { return  homeEntity.showPhotoImage}
    }
}
