//
//  PhotoView.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//


import UIKit

protocol PhotoViewProtocol: class {
 func setPhoto(image: UIImage)
}

class PhotoView: UIViewController {

 @IBOutlet weak var photoImage: UIImageView!
    
 var presenter: PhotoPresenterProtocol?
 var assambly: PhotoAssamblyProtocol = PhotoAssambly()

 override func viewDidLoad() {
   super.viewDidLoad()

   assambly.configure(viewController: self)
   presenter?.configureView()

 }
    @IBAction func backToHome(_ sender: Any) {
       presenter?.backToHomePressed()
 }
}

extension PhotoView: PhotoViewProtocol {
 func setPhoto(image: UIImage) {
   photoImage.image = image
 }
}
