//
//  SecondViewController.swift
//  MyNewProject
//
//  Created by Salavat on 11.02.2023.
//

import UIKit
 
class SecondViewController: UIViewController {
 
    
@IBOutlet weak var emodjiLabel: UILabel!
var emodji = "😪"

    override func viewDidLoad() {
        super.viewDidLoad()
        emodjiLabel.text = emodji
        print("SecondVC", #function)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self,
                                                            action: #selector(edit))
    }
        @objc func edit() {
            print("Edit is done")
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
     // MARK: viewWillAppear(:)
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         print("SecondVC", #function)
     }
 
     // MARK: viewWillLayoutSubviews(:)
     override func viewWillLayoutSubviews() {
         print("SecondVC", #function)
     }
 
     // MARK: viewDidLayoutSubviews(:)
     override func viewDidLayoutSubviews() {
         print("SecondVC", #function)
     }
 
     // MARK: viewDidAppear(:)
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         print("SecondVC", #function)
     }
 
     // MARK: viewWillDisappear(:)
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         print("SecondVC", #function)
     }
 
     // MARK: viewDidDisappear(:)
     override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         print("SecondVC", #function)
     }
}

