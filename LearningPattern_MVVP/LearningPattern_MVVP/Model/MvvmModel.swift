//
//  MvvmModel.swift
//  LearningPattern_MVVP
//
//  Created by Salavat on 21.03.2023.
//

import Foundation

enum MvvmModel {
    
    case initial(Model)
    case loading(Model)
    case success(Model)
    case failure(Model)
    
    struct Model {
        let image: String
        let isHidden: Bool
    }
}

