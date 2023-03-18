//
//  ViewController.swift
//  MVP_Project
//
//  Created by Salavat on 18.03.2023.
//

import UIKit



class ViewController: UIViewController, PresentView {
    func updateLabel() {
        simpleLabel.text = "Something changed"
        
        view.backgroundColor = .gray
    }
    

    @IBOutlet weak var simpleButton: UIButton!
    
    @IBOutlet weak var simpleLabel: UILabel!
    
    lazy var presenter = Presenter(ourView: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func simpleButtonAction(_ sender: Any) {
        presenter.buttonTapped()
    }
    
}

