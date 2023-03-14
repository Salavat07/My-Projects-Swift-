//
//  ViewController.swift
//  fakeMessanger
//
//  Created by Salavat on 12.03.2023.
//

import UIKit
import WebKit
import SafariServices

    class ViewController : UIViewController {
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        @IBAction func myAnswerBtnPressed(_ sender: Any) {
            var url = URL(string: "https://www.apple.com/macbook-air/")
            let safariVC = SFSafariViewController(url: url!)
            present(safariVC, animated: true)
            safariVC.preferredBarTintColor = .purple
            
        }
        @IBAction func showWebView(_ sender: Any) {
            
            guard let showVC = storyboard?.instantiateViewController(identifier: "ShowWebView") else { return }
            
            present(showVC, animated: true, completion: nil)
        }
    }
    
