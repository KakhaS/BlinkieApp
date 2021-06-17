//
//  registerViewController.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 07.04.21.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var topPhoto: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.setNavigationBarHidden(true, animated: true)
        backgroundPhoto.image = UIImage(named: "BackgroundRegisterPage")
        backgroundPhoto.contentMode = .scaleToFill
        topPhoto.image = UIImage(named: "RegisterTop")
    }

}
