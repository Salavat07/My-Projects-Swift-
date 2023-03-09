import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenCarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var purpleCarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowCarTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var raceView: UIView!
    @IBOutlet weak var yellowCarImageView: UIImageView!
    
    let duration = 6.0
    let delay = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start(_ sender: Any) {
        let carHeight = yellowCarImageView.frame.height
        let distance = raceView.frame.height - CGFloat(carHeight + 20)
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveLinear) {
            self.greenCarTopConstraint.constant = distance
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn) {
            self.purpleCarTopConstraint.constant = distance
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut) {
            self.yellowCarTopConstraint.constant = distance
            self.view.layoutIfNeeded()
        }
    }
}

