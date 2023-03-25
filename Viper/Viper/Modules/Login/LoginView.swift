//
//  LoginView.swift
//  Viper
//
//  Created by Salavat on 23.03.2023.
//

import UIKit

protocol LoginViewProtocol: class{
    func setLoginbuttonImage(image: UIImage)
}

class LoginView: UIViewController {

    let segueIdentifier = "LoginToHome"

    var presenter: LoginPresenterProtocol!
     
    var assambly: LoginAssamblyProtocol = LoginAssambly() as! LoginAssamblyProtocol
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assambly.configure(view: self)
        presenter.configureView()
        
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        presenter.loginPressed()
    }
}
extension LoginView: LoginViewProtocol{
    func setLoginbuttonImage(image: UIImage){
        loginBtn.setBackgroundImage(image, for: .normal)
    }
}
