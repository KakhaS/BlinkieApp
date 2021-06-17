//
//  detailsViewController.swift
//  
//
//  Created by Kakha Sepashvili on 01.05.21.
//

import UIKit

class detailsViewController: UIViewController {
    
    @IBOutlet weak var backgroundPhoto: UIImageView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private let mainTextLabel: UILabel = {
        let mainTextLabel = UILabel()
        
        mainTextLabel.textColor = .white
        mainTextLabel.backgroundColor = .systemBlue
        mainTextLabel.numberOfLines = 30
        mainTextLabel.text = "lorem impsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum"
        
        return mainTextLabel
    }()
    
    private let nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.borderWidth = 0.3
        nextButton.layer.borderColor = UIColor.white.cgColor
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
        return nextButton
        
    }()
    
    @objc func tappedNext() {
        let vc = storyboard?.instantiateViewController(identifier: "pictureViewController") as! pictureViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage-1")
        
        view.addSubview(mainTextLabel)
        view.addSubview(nextButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        mainTextLabel.frame = CGRect(x: 120, y: 200, width: 600, height: 700)
        nextButton.frame = CGRect(x: screenWidth * 0.8, y: screenHeight * 0.9, width: 80, height: 80)
    }
}
