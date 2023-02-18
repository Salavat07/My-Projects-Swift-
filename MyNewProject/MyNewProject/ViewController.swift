//
//  ViewController.swift
//  MyNewProject
//
//  Created by Salavat on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    

  
    
    @IBOutlet weak var emodjiTextField: UITextView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            rightBarButtonItem.title = "Settings"
            rightBarButtonItem.target = self
            rightBarButtonItem.action = #selector(edit)
            rightBarButtonItem.style = .done


            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
    
    
    @objc func edit() {
        print("Edit is done")
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "emodji" else { return }
            guard let destination = segue.destination as? SecondViewController else { return }
                destination.emodji = emodjiTextField.text ?? ""
        }
    
    // При нажатии на любое место экрана клавиатура скроется
        @objc func dismissKeyboard() {
          view.endEditing(true)
        }
    }


