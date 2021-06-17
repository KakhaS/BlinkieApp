//
//  ViewController.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 07.04.21.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController {

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log in"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemBlue
        return label
    }()
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Address"
        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = UIColor.blue.cgColor
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    
    private let passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry =   true
        passwordField.layer.borderColor = UIColor.blue.cgColor
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return passwordField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()
    
    private let forgotButton: UIButton = {
    let forgotButton = UIButton()
        forgotButton.backgroundColor = .systemBlue
        forgotButton.layer.borderWidth = 2
        forgotButton.layer.borderColor = .none
        forgotButton.setTitleColor(.white, for: .normal)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
    
        return forgotButton
    }()
    
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var backgroundPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        //background photo
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage")
        backgroundPhoto.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        backgroundPhoto.contentMode = .scaleToFill
        backgroundPhoto.alpha = 0.2
        
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(forgotButton)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "main", sender: self)
    
        }
        GDSSignedIN()
    }
    
    
    func GDSSignedIN() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance().signIn()
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        // sizes and location on screen
        
        label.frame = CGRect(x: screenWidth * 0.00005,
                             y: screenWidth / 10,
                             width: screenWidth,
                             height: screenHeight * 0.1)
        emailField.frame = CGRect(x: screenWidth * 0.25,
                                  y: screenHeight * 0.4,
                                  width: screenWidth * 0.5,
                                  height: screenWidth * 0.045)
        passwordField.frame = CGRect(x: screenWidth * 0.25,
                                     y: screenHeight * 0.46,
                                     width: screenWidth * 0.5,
                                     height: screenHeight * 0.033)
        button.frame = CGRect(x: screenWidth * 0.35,
                              y: screenHeight * 0.65,
                              width: screenWidth * 0.32,
                              height: screenHeight * 0.05)
        
        signInButton.frame = CGRect(x: screenWidth * 0.341,
                                    y: screenHeight * 0.72,
                                    width: screenWidth * 0.34,
                                    height: screenHeight * 1)
        
        forgotButton.frame = CGRect(x: screenWidth * 0.341,
                                    y: screenHeight * 0.58,
                                    width: screenWidth * 0.32,
                                    height: screenHeight * 0.04)

    }
    

    @objc private func didTapButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else{
                return
            }
            
            guard error == nil else {
                // show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            self!.performSegue(withIdentifier: "main", sender: nil)
       
        })
    }
    
    
    @objc func forgotPassword() {
        Auth.auth().sendPasswordReset(withEmail: emailField.text!) { error in
            DispatchQueue.main.async {
                if self.emailField.text?.isEmpty == true || error != nil {
                    let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Reset", preferredStyle: .alert)
                    resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(resetFailedAlert, animated: true, completion: nil)
                }
                if error == nil && self.emailField.text?.isEmpty == false {
                    let resetEmailAlertSent = UIAlertController(title: "Reset email Sent, Check your E mail", message: "Reset E mail has been sent. Please follow the instructions in order to reset the PASSWORD.", preferredStyle: .alert)
                    resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: .none))
                    self.present(resetEmailAlertSent, animated: true, completion: nil)
                }
            }
        }
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Looks Like new account ! Would you like to create an account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
                                        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                                            guard self != nil else{
                                                return
                                            }
                                            
                                            guard error == nil else {
                                                // show account creation
                                                print("Woops ! Account creation failed")
                                                return
                                            }
                                            print("You have Signed in")
                                            self!.performSegue(withIdentifier: "main", sender: nil)
                                            
                                        })
                                      }))
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
                                      }))
        
        present(alert, animated: true)
    }
}
extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
print("Woops")
        } else {
            performSegue(withIdentifier: "main", sender: nil)
        }
    }
    
}
