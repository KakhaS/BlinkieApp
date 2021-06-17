//
//  manualViewController.swift
//  
//
//  Created by Kakha Sepashvili on 18.04.21.
//

import UIKit

class manualViewController: UIViewController {

        private let background: UIImageView = {
            let background = UIImageView()
            background.image = UIImage(named: "Background2")
            return background
        }()
        
        private let mainText: UILabel = {
            let mainText = UILabel()
            return mainText
        }()


        override func viewDidLoad() {
            super.viewDidLoad()

            view.addSubview(background)
            view.addSubview(mainText)
      
           
            
            mainText.numberOfLines = 10
            mainText.text = "OUR COMPANY INFO GOES HERE"
            mainText.textAlignment = .center
            mainText.textColor = .white
        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            background.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            mainText.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        }
}

