//
//  ViewController.swift
//  MyNewProject
//
//  Created by Salavat on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var stackview: UIStackView!
    
    @IBOutlet weak var but: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*    stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .equalCentering
        stackview.spacing = 20 */
}
    
    
    @IBAction func but1(_ sender: UIButton) {
        label.backgroundColor = .green
    //    label.font = UIFont(name: "Times New ROman", size: 30)
        label.alpha = 0
      //  stackview.backgroundColor = .green
    }
    
    }
    



