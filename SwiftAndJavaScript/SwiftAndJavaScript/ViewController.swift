//
//  ViewController.swift
//  SwiftAndJavaScript
//
//  Created by Salavat on 14.03.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://gmail.com")
           let request = URLRequest(url: url!)
           webView.load(request)

        // Do any additional setup after loading the view.
    }

    @IBAction func javascriptInjectionBtnPressed(_ sender: Any) {
        
       webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML")
        { value, error in
             print("VALUE: \(value)")
             print("ERROR: \(error)")
           }

        webView.evaluateJavaScript("document.getElementById('Email').value='MyEmail123'", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementById('next').value='Hello World'", completionHandler: nil)
        webView.evaluateJavaScript("document.getElementById('next').style.background='#FF2D55'", completionHandler: nil)


    }
    
}

