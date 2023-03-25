//
//  MvvmView.swift
//  LearningPattern_MVVP
//
//  Created by Salavat on 21.03.2023.
//

import UIKit

class MvvmView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MvvmViewModel()
        getState()
        viewModel.showDefaultImage()
    }
    
    
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var showActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    

    var viewModel: MvvmViewModelProtocol!
    
    private func update(state: MvvmModel.Model?) {
         guard let state = state else { return }
        showImageView.image = UIImage(named: state.image)
        showActivityIndicator.isHidden = state.isHidden
       }
    
    private func getState() {
        self.showActivityIndicator.isHidden = true
     
        viewModel.updateView = { [weak self] data in
          guard let self = self else { return }
          switch data {
              
          case .initial(let initial):
          self.update(state: initial )
          self.showActivityIndicator.stopAnimating()
              
          case .loading(let loading):
            self.update(state: loading)
            self.showActivityIndicator.startAnimating()
              
          case .success(let success):
            self.update(state: success)
            self.showActivityIndicator.stopAnimating()
              
          case .failure(let failure):
            self.update(state: failure)
            self.showActivityIndicator.stopAnimating()
          }
        }
      }
    
    @IBAction func firstButtPressed(_ sender: Any) {
        viewModel.showFirstImage()
    }
    
    @IBAction func secondButtPressed(_ sender: Any) {
        viewModel.showSecondImage()
    }
}
