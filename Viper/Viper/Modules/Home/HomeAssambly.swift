//
//  HomeAssambly.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit


protocol HomeAssamblyProtocol: class {
    func configure(viewController: HomeView)
}

class HomeAssambly: HomeAssamblyProtocol {
    func configure(viewController: HomeView) {
        let presenter = HomePresenter(viewController)
        let interactor = HomeInteractor(presenter)
        let router = HomeRouter(viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
