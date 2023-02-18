//
//  ViewController.swift
//  Business Card App.
//
//  Created by Salavat on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var mail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
      
    }
    @objc func edit() {
        print("Edit is done")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "personalData" else { return }
        guard let destination = segue.destination as? SecondViewController else { return }
        destination.personalData = name.text ?? ""
        destination.personalData = age.text ?? ""
        destination.personalData = city.text ?? ""
        destination.personalData = mail.text ?? ""
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

