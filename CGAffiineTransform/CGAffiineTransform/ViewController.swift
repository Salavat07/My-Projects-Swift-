//
//  ViewController.swift
//  CGAffiineTransform
//
//  Created by Salavat on 09.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var isFlipped = false
    var predictions = ["Two month until you become a junior",
                       "Two years until you become a millioner",
                       "Two month until will lift 100 kg",
                       "Two years left until you will be in USA",
                       "Three month until i will be in Bishkek"]
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var secondViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
    }
    @IBAction func transitionCard(_ sender: Any) {
        isFlipped = !isFlipped
        
        let firstCard = isFlipped ? firstView : secondView
        let secondCard = isFlipped ? secondView : firstView
        
        UIView.transition(from: firstCard!, to: secondCard!, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews]) { _ in
            let randomInt  = Int.random(in: 0..<self.predictions.count)
            self.secondViewLabel.text = self.predictions[randomInt]
        }
    }
}
