//
//  ViewController.swift
//  MyWebView
//
//  Created by Salavat on 11.03.2023.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    @IBOutlet weak var webKitView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://apple.com")!
        let request = URLRequest(url: url)
        webKitView.load(request)
    }
}
