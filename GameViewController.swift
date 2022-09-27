//
//  GameViewController.swift
//  dema
//
//  Created by Salavat on 05.09.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    lazy var game = Game(countItems: buttons.count)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    

    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index:buttonIndex)
        updateUi()
 
    }
    private func setupScreen(){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
            
        }
        nextDigit.text = game.nextItem?.title
    }
    private func updateUi(){
        for index in game.items.indices{
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
        
        if game.status == .win{
            
            statusLabel.text = "You won!"
            statusLabel.textColor = .green
        }
    }
}


