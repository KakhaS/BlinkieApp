//
//  ledColorsViewController.swift
//  
//
//  Created by Kakha Sepashvili on 05.05.21.
//

import UIKit

class ledColorsViewController: UIViewController {
    
    @IBOutlet weak var backgroundPhoto: UIImageView!

    private let homeButton: UIButton = {
       let homeButton = UIButton()
        homeButton.setTitle("HOME", for: .normal)
        homeButton.layer.borderWidth = 0.5
        homeButton.layer.borderColor = UIColor.blue.cgColor
        homeButton.setTitleColor(.red, for: .normal)
        homeButton.backgroundColor = .white
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        return homeButton
    }()
    
    private let colorButton1: UIButton = {
       let colorButton1 = UIButton()
        colorButton1.backgroundColor = .green
        colorButton1.layer.borderWidth = 0.2
        colorButton1.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton1
    }()
    
    private let colorButtonText1: UIButton = {
       let colorButtonText1 = UIButton()
        colorButtonText1.setTitle("1", for: .normal)
        colorButtonText1.layer.borderWidth = 0.2
        colorButtonText1.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText1
    }()
    
    private let colorButton2: UIButton = {
       let colorButton2 = UIButton()
        colorButton2.backgroundColor = .red
        colorButton2.layer.borderWidth = 0.2
        colorButton2.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton2
    }()
    
    private let colorButtonText2: UIButton = {
       let colorButtonText2 = UIButton()
        colorButtonText2.setTitle("Led1", for: .normal)
        colorButtonText2.layer.borderWidth = 0.2
        colorButtonText2.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText2
    }()
    
    private let colorButton3: UIButton = {
       let colorButton3 = UIButton()
        colorButton3.backgroundColor = .blue
        colorButton3.layer.borderWidth = 0.2
        colorButton3.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton3
    }()
    
    private let colorButtonText3: UIButton = {
       let colorButtonText3 = UIButton()
        colorButtonText3.setTitle("K", for: .normal)
        colorButtonText3.layer.borderWidth = 0.2
        colorButtonText3.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText3
    }()
    
    
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage-1")
        backgroundPhoto.contentMode = .scaleAspectFill
        
        //addsubviews
       
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeButton.frame = CGRect(x: 690, y: 75, width: 60, height: 30)

        
    }
}
