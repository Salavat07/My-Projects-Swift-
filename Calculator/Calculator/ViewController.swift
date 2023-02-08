//
//  ViewController.swift
//  Calculator
//
//  Created by Salavat on 06.02.2023.
//

import UIKit

class ViewController: UIViewController {
 
    var numberScreen:Double = 0
    var firstNumber:Double = 0
    var sign:Bool = false
    var operation:Int = 0
    
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        
        if sign == true {
            result.text = String(sender.tag)
            sign = false
        }
        else{
            result.text = result.text! + String(sender.tag)

        }
        
        numberScreen = Double(result.text!)!
    }
        
            
            
    @IBAction func buttons(_ sender: UIButton) {
        
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNumber = Double(result.text!)!
            
            if sender.tag == 11{
                result.text = "/"
            }
            else if sender.tag == 12{
                result.text = "x"
                
            }else if sender.tag == 13{
                result.text = "-"
                
            }else if sender.tag == 14{
                result.text = "+"
            }
            operation = sender.tag
            sign = true
        }
        else if sender.tag == 15{
            
            if operation == 11{
                result.text = String(firstNumber / numberScreen)
            }
            else if operation == 12{
                result.text = String(firstNumber * numberScreen)
            }
            else if operation == 13{
                result.text = String(firstNumber - numberScreen)
            }
            else if operation == 14{
                result.text = String(firstNumber + numberScreen)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            firstNumber = 0
            numberScreen = 0
            operation = 0
        }
    }
     
    override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view.
            }
    }

