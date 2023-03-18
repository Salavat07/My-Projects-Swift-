//
//  Presenter.swift
//  MVP_Project
//
//  Created by Salavat on 18.03.2023.
//

import Foundation

protocol PresentView{
    func updateLabel()
}

class Presenter{
    
    var ourView: PresentView?
    
    init(ourView: PresentView) {
        self.ourView = ourView
    }
    
    var timesTapped = 0
    func buttonTapped(){
        timesTapped += 1
        
        if timesTapped >= 3{
            self.ourView?.updateLabel()
        }
    }
}
