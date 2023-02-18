//
//  SecondViewController.swift
//  Business Card App.
//
//  Created by Salavat on 12.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    struct User{
        
    }
    var personalData = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstProfileLabel.text = personalData
        secondProfileLabel.text = personalData
        thirdProfileLabel.text = personalData
        lastProfileLabel.text = personalData
        print("SecondVC", #function)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                                target: self,
                                                                action: #selector(edit))
    
    }
    @objc func edit() {
             print("Edit is done")
         }
    @IBOutlet weak var firstProfileLabel: UILabel!
    @IBOutlet weak var secondProfileLabel: UILabel!
    @IBOutlet weak var thirdProfileLabel: UILabel!
    @IBOutlet weak var lastProfileLabel: UILabel!
}
