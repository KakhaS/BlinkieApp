//
//  firstPageViewController.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 07.04.21.
//

import UIKit
import Firebase
import FirebaseAuth

struct ip: Codable {
let ip: String
let country: String
let cc: String
}
let userID = Auth.auth().currentUser?.uid


struct Item {
    var imageName: String
    var destination: String
}

class firstPageViewController: UIViewController {
    
    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
   let ipLabel = UILabel()
    private var fetchData = FetchData()

    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.borderWidth = 2
        button.layer.borderColor = .none
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log out", for: .normal)
        
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()

    
    func checkIfUserIsLoggedIn() {
        if userID == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }, withCancel: nil)
        }
    }

    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
            
            performSegue(withIdentifier: "back", sender: nil)
            
          
            
        } catch let logoutError {
            print(logoutError)
        }
        
    print("signout")
    
    }
    
    @objc func didTapButtonA() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690,
                                  y: 35,
                                  width: 60,
                                  height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        
        databaseA.addTarget(self, action: #selector(didTapButtonDoubleA), for: .touchUpInside)
    }
    
    @objc func didTapButtonB() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonC() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonD() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonE() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonF() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonG() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonH() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonI() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonK() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonL() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonM() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonN() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonO() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonP() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonQ() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonR() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonS() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonT() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapButtonU() {
        topMessage.text = "Football teams"
        databaseA.setTitle("FootBall team A", for: .normal)
        databaseB.setTitle("FootBall team B", for: .normal)
        databaseC.setTitle("FootBall team C", for: .normal)
        databaseD.setTitle("FootBall team D", for: .normal)
        databaseE.setTitle("FootBall team E", for: .normal)
        databaseF.setTitle("FootBall team F", for: .normal)
        databaseG.setTitle("FootBall team G", for: .normal)
        databaseH.setTitle("FootBall team H", for: .normal)
        databaseI.setTitle("FootBall team I", for: .normal)
        databaseK.setTitle("FootBall team K", for: .normal)
        databaseL.setTitle("FootBall team L", for: .normal)
        databaseM.setTitle("FootBall team M", for: .normal)
        databaseN.setTitle("FootBall team N", for: .normal)
        databaseO.setTitle("FootBall team O", for: .normal)
        databaseP.setTitle("FootBall team P", for: .normal)
        databaseQ.setTitle("FootBall team Q", for: .normal)
        databaseR.setTitle("FootBall team R", for: .normal)
        databaseS.setTitle("FootBall team S", for: .normal)
        databaseT.setTitle("FootBall team T", for: .normal)
        databaseU.setTitle("FootBall team U", for: .normal)
        
        view.addSubview(homeButton)
        view.addSubview(signOutButton)
        homeButton.frame = CGRect(x: 690, y: 35, width: 60, height: 30)
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        
        checkIfUserIsLoggedIn()
    }
    
    
    @objc func didTapButtonDoubleA() {
        let vc3 = storyboard?.instantiateViewController(identifier: "teamViewController") as! teamViewController
        
        vc3.modalPresentationStyle = .fullScreen
        present(vc3, animated: true)
    }
    @objc func didTapButtonDoubleB() {
        
    }
    @objc func didTapButtonDoubleC() {
        
    }
    @objc func didTapButtonDoubleD() {
        
    }
    @objc func didTapButtonDoubleG() {
        
    }
    @objc func didTapButtonDoubleH() {
        
    }
    @objc func didTapButtonDoubleI() {
        
    }
    @objc func didTapButtonDoubleK() {
        
    }
    @objc func didTapButtonDoubleL() {
        
    }
    @objc func didTapButtonDoubleM() {
        
    }
    @objc func didTapButtonDoubleN() {
        
    }
    @objc func didTapButtonDoubleO() {
        
    }
    @objc func didTapButtonDoubleP() {
        
    }
    @objc func didTapButtonDoubleQ() {
        
    }
    @objc func didTapButtonDoubleR() {
        
    }
    @objc func didTapButtonDoubleS() {
        
    }
    @objc func didTapButtonDoubleT() {
        
    }
    @objc func didTapButtonDoubleU() {
        
    }
    

        
    
    
    
    //button funcs end here
    
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    

    
    private let homeButton: UIButton = {
       let homeButton = UIButton()
        homeButton.setTitle("HOME", for: .normal)
        homeButton.layer.borderWidth = 0.5
        homeButton.layer.borderColor = UIColor.blue.cgColor
        homeButton.setTitleColor(.red, for: .normal)
        homeButton.backgroundColor = .white
        return homeButton
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settings"), for: .normal)
        return button
    }()
    
  private let databaseA: UIButton = {
        let databaseA = UIButton()
        databaseA.backgroundColor = .white
        databaseA.layer.borderWidth = 1
        databaseA.layer.borderColor = UIColor.blue.cgColor
        databaseA.setTitleColor(.systemPink, for: .normal)
        databaseA.setTitle("A", for: .normal)
        databaseA.contentHorizontalAlignment = .right
        databaseA.addTarget(nil, action: #selector(didTapButtonA), for: .touchUpInside)
        return databaseA
    }()
    
    private let databaseB: UIButton = {
        let databaseB = UIButton()
        databaseB.backgroundColor = .white
        databaseB.layer.borderWidth = 1
        databaseB.layer.borderColor = UIColor.blue.cgColor
        databaseB.setTitleColor(.systemPink, for: .normal)
        databaseB.setTitle("B", for: .normal)
        databaseB.contentHorizontalAlignment = .right
        databaseB.addTarget(nil, action: #selector(didTapButtonB), for: .touchUpInside)
        return databaseB
    }()
    
    private let databaseC: UIButton = {
        let databaseC = UIButton()
        databaseC.backgroundColor = .white
        databaseC.layer.borderWidth = 1
        databaseC.layer.borderColor = UIColor.blue.cgColor
        databaseC.setTitleColor(.systemPink, for: .normal)
        databaseC.setTitle("C", for: .normal)
        databaseC.contentHorizontalAlignment = .right
        databaseC.addTarget(nil, action: #selector(didTapButtonC), for: .touchUpInside)
        return databaseC
    }()
    
    private let databaseD: UIButton = {
        let databaseD = UIButton()
        databaseD.backgroundColor = .white
        databaseD.layer.borderWidth = 1
        databaseD.layer.borderColor = UIColor.blue.cgColor
        databaseD.setTitleColor(.systemPink, for: .normal)
        databaseD.setTitle("D", for: .normal)
        databaseD.contentHorizontalAlignment = .right
        databaseD.addTarget(nil, action: #selector(didTapButtonD), for: .touchUpInside)
        return databaseD
    }()
    
    private let databaseE: UIButton = {
        let databaseE = UIButton()
        databaseE.backgroundColor = .white
        databaseE.layer.borderWidth = 1
        databaseE.layer.borderColor = UIColor.blue.cgColor
        databaseE.setTitleColor(.systemPink, for: .normal)
        databaseE.setTitle("E", for: .normal)
        databaseE.contentHorizontalAlignment = .right
        databaseE.addTarget(nil, action: #selector(didTapButtonE), for: .touchUpInside)
        return databaseE
    }()
    
    private let databaseF: UIButton = {
        let databaseF = UIButton()
        databaseF.backgroundColor = .white
        databaseF.layer.borderWidth = 1
        databaseF.layer.borderColor = UIColor.blue.cgColor
        databaseF.setTitleColor(.systemPink, for: .normal)
        databaseF.setTitle("F", for: .normal)
        databaseF.contentHorizontalAlignment = .right
        databaseF.addTarget(nil, action: #selector(didTapButtonF), for: .touchUpInside)
        return databaseF
    }()
    
    private let databaseG: UIButton = {
        let databaseG = UIButton()
        databaseG.backgroundColor = .white
        databaseG.layer.borderWidth = 1
        databaseG.layer.borderColor = UIColor.blue.cgColor
        databaseG.setTitleColor(.systemPink, for: .normal)
        databaseG.setTitle("G", for: .normal)
        databaseG.contentHorizontalAlignment = .right
        databaseG.addTarget(nil, action: #selector(didTapButtonG), for: .touchUpInside)
        return databaseG
    }()
    
    private let databaseH: UIButton = {
        let databaseH = UIButton()
        databaseH.backgroundColor = .white
        databaseH.layer.borderWidth = 1
        databaseH.layer.borderColor = UIColor.blue.cgColor
        databaseH.setTitleColor(.systemPink, for: .normal)
        databaseH.setTitle("H", for: .normal)
        databaseH.contentHorizontalAlignment = .right
        databaseH.addTarget(nil, action: #selector(didTapButtonH), for: .touchUpInside)
        return databaseH
    }()
    
    private let databaseI: UIButton = {
        let databaseI = UIButton()
        databaseI.backgroundColor = .white
        databaseI.layer.borderWidth = 1
        databaseI.layer.borderColor = UIColor.blue.cgColor
        databaseI.setTitleColor(.systemPink, for: .normal)
        databaseI.setTitle("I", for: .normal)
        databaseI.contentHorizontalAlignment = .right
        databaseI.addTarget(nil, action: #selector(didTapButtonI), for: .touchUpInside)
        return databaseI
    }()
    
    private let databaseK: UIButton = {
        let databaseK = UIButton()
        databaseK.backgroundColor = .white
        databaseK.layer.borderWidth = 1
        databaseK.layer.borderColor = UIColor.blue.cgColor
        databaseK.setTitleColor(.systemPink, for: .normal)
        databaseK.setTitle("K", for: .normal)
        databaseK.contentHorizontalAlignment = .right
        databaseK.addTarget(nil, action: #selector(didTapButtonK), for: .touchUpInside)
        return databaseK
    }()
    
    private let databaseL: UIButton = {
        let databaseL = UIButton()
        databaseL.backgroundColor = .white
        databaseL.layer.borderWidth = 1
        databaseL.layer.borderColor = UIColor.blue.cgColor
        databaseL.setTitleColor(.systemPink, for: .normal)
        databaseL.setTitle("L", for: .normal)
        databaseL.contentHorizontalAlignment = .right
        databaseL.addTarget(nil, action: #selector(didTapButtonL), for: .touchUpInside)
        return databaseL
    }()
    
    private let databaseM: UIButton = {
        let databaseM = UIButton()
        databaseM.backgroundColor = .white
        databaseM.layer.borderWidth = 1
        databaseM.layer.borderColor = UIColor.blue.cgColor
        databaseM.setTitleColor(.systemPink, for: .normal)
        databaseM.setTitle("M", for: .normal)
        databaseM.contentHorizontalAlignment = .right
        databaseM.addTarget(nil, action: #selector(didTapButtonM), for: .touchUpInside)
        return databaseM
    }()
    
    private let databaseN: UIButton = {
        let databaseN = UIButton()
        databaseN.backgroundColor = .white
        databaseN.layer.borderWidth = 1
        databaseN.layer.borderColor = UIColor.blue.cgColor
        databaseN.setTitleColor(.systemPink, for: .normal)
        databaseN.setTitle("N", for: .normal)
        databaseN.contentHorizontalAlignment = .right
        databaseN.addTarget(nil, action: #selector(didTapButtonN), for: .touchUpInside)
        return databaseN
    }()

    private let databaseO: UIButton = {
        let databaseO = UIButton()
        databaseO.backgroundColor = .white
        databaseO.layer.borderWidth = 1
        databaseO.layer.borderColor = UIColor.blue.cgColor
        databaseO.setTitleColor(.systemPink, for: .normal)
        databaseO.setTitle("O", for: .normal)
        databaseO.contentHorizontalAlignment = .right
        databaseO.addTarget(nil, action: #selector(didTapButtonO), for: .touchUpInside)
        return databaseO
    }()
    
    private let databaseP: UIButton = {
        let databaseP = UIButton()
        databaseP.backgroundColor = .white
        databaseP.layer.borderWidth = 1
        databaseP.layer.borderColor = UIColor.blue.cgColor
        databaseP.setTitleColor(.systemPink, for: .normal)
        databaseP.setTitle("P", for: .normal)
        databaseP.contentHorizontalAlignment = .right
        databaseP.addTarget(nil, action: #selector(didTapButtonP), for: .touchUpInside)
        return databaseP
    }()
    
    private let databaseQ: UIButton = {
        let databaseQ = UIButton()
        databaseQ.backgroundColor = .white
        databaseQ.layer.borderWidth = 1
        databaseQ.layer.borderColor = UIColor.blue.cgColor
        databaseQ.setTitleColor(.systemPink, for: .normal)
        databaseQ.setTitle("Q", for: .normal)
        databaseQ.contentHorizontalAlignment = .right
        databaseQ.addTarget(nil, action: #selector(didTapButtonQ), for: .touchUpInside)
        return databaseQ
    }()
    
    private let databaseR: UIButton = {
        let databaseR = UIButton()
        databaseR.backgroundColor = .white
        databaseR.layer.borderWidth = 1
        databaseR.layer.borderColor = UIColor.blue.cgColor
        databaseR.setTitleColor(.systemPink, for: .normal)
        databaseR.setTitle("R", for: .normal)
        databaseR.contentHorizontalAlignment = .right
        databaseR.addTarget(nil, action: #selector(didTapButtonR), for: .touchUpInside)
        return databaseR
    }()
    
    private let databaseS: UIButton = {
        let databaseS = UIButton()
        databaseS.backgroundColor = .white
        databaseS.layer.borderWidth = 1
        databaseS.layer.borderColor = UIColor.blue.cgColor
        databaseS.setTitleColor(.systemPink, for: .normal)
        databaseS.setTitle("S", for: .normal)
        databaseS.contentHorizontalAlignment = .right
        databaseS.addTarget(nil, action: #selector(didTapButtonS), for: .touchUpInside)
        return databaseS
    }()
    
    private let databaseT: UIButton = {
        let databaseT = UIButton()
        databaseT.backgroundColor = .white
        databaseT.layer.borderWidth = 1
        databaseT.layer.borderColor = UIColor.blue.cgColor
        databaseT.setTitleColor(.systemPink, for: .normal)
        databaseT.setTitle("T", for: .normal)
        databaseT.contentHorizontalAlignment = .right
        databaseT.addTarget(nil, action: #selector(didTapButtonT), for: .touchUpInside)
        return databaseT
    }()
    
    private let databaseU: UIButton = {
        let databaseU = UIButton()
        databaseU.backgroundColor = .white
        databaseU.layer.borderWidth = 1
        databaseU.layer.borderColor = UIColor.blue.cgColor
        databaseU.setTitleColor(.systemPink, for: .normal)
        databaseU.setTitle("U", for: .normal)
        databaseU.contentHorizontalAlignment = .right
        databaseU.addTarget(nil, action: #selector(didTapButtonU), for: .touchUpInside)
        return databaseU
    }()
    
    private let topMessage: UILabel = {
       let topMessage = UILabel()
        topMessage.textColor = .white
        topMessage.backgroundColor = .systemBlue
        topMessage.text = "Selected Menu"
        return topMessage
    }()
    
    
    
    let Items: [Item] = [
        Item(imageName: "Collectionviewcell1", destination: "about"),
        Item(imageName: "Collectionviewcell2", destination: "contact"),
        Item(imageName: "Collectionviewcell3", destination: "manual")]
    
    let jsonUrlString = "https://api.myip.com"
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(settingsButton)
        
        
        view.addSubview(databaseA)
        view.addSubview(databaseB)
        view.addSubview(databaseC)
        view.addSubview(databaseD)
        view.addSubview(databaseE)
        view.addSubview(databaseF)
        view.addSubview(databaseG)
        view.addSubview(databaseH)
        view.addSubview(databaseI)
        view.addSubview(databaseK)
        view.addSubview(databaseL)
        view.addSubview(databaseM)
        view.addSubview(databaseN)
        view.addSubview(databaseO)
        view.addSubview(databaseP)
        view.addSubview(databaseQ)
        view.addSubview(databaseR)
        view.addSubview(databaseS)
        view.addSubview(databaseT)                  
        view.addSubview(databaseU)
        view.addSubview(topMessage)
        view.addSubview(ipLabel)
        view.addSubview(signOutButton)
        
        collectionView.register(infoCollectionViewCell.nib(), forCellWithReuseIdentifier: "infoCollectionViewCell")
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage-1")
        backgroundPhoto.contentMode = .scaleAspectFill
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            collectionView.backgroundColor = .none
        }
        
        
        let layout1 = UICollectionViewFlowLayout()
        let cellSize = CGSize(width: 200, height: 30)
        layout1.itemSize = cellSize
        layout1.minimumLineSpacing = 2.0
        layout1.minimumInteritemSpacing = 2.0
        
        collectionView.setCollectionViewLayout(layout1, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        layout1.scrollDirection = .horizontal
        
        fetchData.fetchData { ip in
            
            self.ipLabel.text = "IP: \(ip)"
            self.ipLabel.textColor = .systemPink
        }
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        ipLabel.frame = CGRect(x: screenWidth * 0.12, y: screenHeight * 0.025, width: screenWidth * 0.2, height: screenHeight * 0.025)
        settingsButton.frame = CGRect(x: screenWidth * 0.82, y: screenHeight * 0.93, width: 30, height: 30)
        
      
        let x = screenWidth * 0.52
        let w = screenWidth * 0.35
        let h = screenHeight * 0.035
        
        databaseA.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.07), width: Int(w), height: Int(h))
        databaseB.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.12), width: Int(w), height: Int(h))
        databaseC.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.17), width: Int(w), height: Int(h))
        databaseD.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.22), width: Int(w), height: Int(h))
        databaseE.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.27), width: Int(w), height: Int(h))
        databaseF.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.32), width: Int(w), height: Int(h))
        databaseG.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.37), width: Int(w), height: Int(h))
        databaseH.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.42), width: Int(w), height: Int(h))
        databaseI.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.47), width: Int(w), height: Int(h))
        databaseK.frame = CGRect(x: Int(screenWidth * 0.12), y: Int(screenHeight * 0.52), width: Int(w), height: Int(h))
        databaseL.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.07), width: Int(w), height: Int(h))
        databaseM.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.12), width: Int(w), height: Int(h))
        databaseN.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.17), width: Int(w), height: Int(h))
        databaseO.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.22), width: Int(w), height: Int(h))
        databaseP.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.27), width: Int(w), height: Int(h))
        databaseQ.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.32), width: Int(w), height: Int(h))
        databaseR.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.37), width: Int(w), height: Int(h))
        databaseS.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.42), width: Int(w), height: Int(h))
        databaseT.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.47), width: Int(w), height: Int(h))
        databaseU.frame = CGRect(x: Int(x), y: Int(screenHeight * 0.52), width: Int(w), height: Int(h))
        
        
        topMessage.frame = CGRect(x: 370, y: 35, width: 120, height: 20)
        signOutButton.frame = CGRect(x: 550, y: 35, width: 120, height: 20)

    }
}




extension firstPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let Item = Items[indexPath.item]
        performSegue(withIdentifier: Item.destination, sender: Item)
    }
}
extension firstPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCollectionViewCell", for: indexPath) as! infoCollectionViewCell
        
        cell.imageView.image = UIImage(named: Items[indexPath.item].imageName)
        return cell
    }
    
    
}
extension firstPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 380)
    }
}
