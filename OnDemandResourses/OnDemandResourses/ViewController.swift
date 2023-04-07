//
//  ViewController.swift
//  OnDemandResourses
//
//  Created by Salavat on 04.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIImageView!
    
    @IBOutlet weak var secondView: UIImageView!
    
    var initialAssets = NSBundleResourceRequest(tags: ["Initial"])
    var photoTwoAssets: NSBundleResourceRequest? = nil
    
    func refreshScreen(){
        firstView.image = UIImage(named: "Photo1")
        secondView.image = UIImage(named: "Photo2")
    }
    
    func loadOnDemandAssets () {
        initialAssets.beginAccessingResources(completionHandler:{[weak self](error) in
            if let _ = error {
                return
            }
            DispatchQueue.main.async {
                self?.refreshScreen ()
            }
        })
    }
   
    func finishUsingOnDemandAssets ( ) { initialAssets.endAccessingResources()
        photoTwoAssets?.endAccessingResources()
        photoTwoAssets = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshScreen()
        self.loadOnDemandAssets()
    }

    @IBAction func ThirdView(_ sender: Any) {
        
        if  photoTwoAssets != nil {
            photoTwoAssets?.endAccessingResources()
            photoTwoAssets = nil
        }
        
        photoTwoAssets = NSBundleResourceRequest(tags: ["Pics2" ])
        photoTwoAssets?.conditionallyBeginAccessingResources(completionHandler:{[weak self] (state) in
            guard state == false else {
                DispatchQueue.main.async {
                    self?.refreshScreen()
                }
                return
            }
            
            self?.photoTwoAssets?.beginAccessingResources(completionHandler: { [weak self](error) in
                if let _ = error {
                    return
                }
                DispatchQueue.main.async {
                    self?.refreshScreen ()
                }
            })
        })
    }
}

