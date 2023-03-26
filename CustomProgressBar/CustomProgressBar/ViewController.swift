//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by Salavat on 26.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let progressBar = ProgressBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupProgressBar()
        animateProgressBar()
    }

    private func setupProgressBar(){
        let progressBarColour = UIColor.purple
        progressBar.totalComponents = 5
        progressBar.filledComponents = 0
        progressBar.spacing = 4
        progressBar.unfilledColour = progressBarColour.withAlphaComponent(0.3)
        progressBar.filledColour = progressBarColour
        progressBar.cornerRadius = 5
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)
        NSLayoutConstraint.activate([
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -295),
            progressBar.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    private func animateProgressBar(){
        var filledComponents: UInt = 0
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            self.progressBar.filledComponents = filledComponents
            self.progressBar.render()
            filledComponents += 1
            if filledComponents == self.progressBar.totalComponents + 1{
                filledComponents = 0
            }
        }
    }
}

