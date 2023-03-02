//
//  ShowImageVC.swift
//  MyImageCollection
//
//  Created by Salavat on 26.02.2023.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentImage.image = UIImage (named: imageName)
    }
    
    func setImageName (name:String){
        imageName = name
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
