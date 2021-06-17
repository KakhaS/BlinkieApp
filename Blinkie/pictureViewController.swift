//
//  pictureViewController.swift
//  
//
//  Created by Kakha Sepashvili on 01.05.21.
//

import UIKit

struct Player {
    var player: String
    var offset: CGRect
}


class CircularImageView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .systemBlue
        self.clipsToBounds = true
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = 20
    }
}


//var arr: [Player] = [
//
//    .init(player: "2", offset: CGRect(x: 150, y: 400, width: 40, height: 40)),
//    .init(player: "1", offset: CGRect(x: 190, y: 440, width: 40, height: 40)),
//    .init(player: "11", offset: CGRect(x: 220, y: 500, width: 40, height: 40))
//]



class pictureViewController: UIViewController {
    
    @IBOutlet weak var backgroundPhoto: UIImageView!
    
    
    var circleOrigin: CGPoint!
    
    
    let circularView1 = CircularImageView()
    let circularView2 = CircularImageView()
    let circularView3 = CircularImageView()
    let circularView4 = CircularImageView()
    let circularView5 = CircularImageView()
    let circularView6 = CircularImageView()
    let circularView7 = CircularImageView()
    let circularView8 = CircularImageView()
    let circularView9 = CircularImageView()
    let circularView10 = CircularImageView()
    let circularView11 = CircularImageView()
    
    
    
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
    
    private let ledButton: UIButton = {
        let ledButton = UIButton()
        ledButton.setTitle("LED Settings", for: .normal)
        ledButton.layer.borderWidth = 0.5
        ledButton.layer.borderColor = UIColor.blue.cgColor
        ledButton.setTitleColor(.red, for: .normal)
        ledButton.backgroundColor = .white
        ledButton.addTarget(self, action: #selector(ledSettings), for: .touchUpInside)
        return ledButton
    }()
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @objc func ledSettings() {
        let vc2 = storyboard?.instantiateViewController(identifier: "ledViewController") as! ledViewController
        
        vc2.modalPresentationStyle = .fullScreen
        present(vc2, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeButton)
        view.addSubview(ledButton)
        
        let circleView = CircularImageView()
        view.addSubview(circleView)
        
        backgroundPhoto.image = UIImage(named: "soccer.pitch")
        
        
        addSubViews()
        subViewFrames()
        addpanGestureView()
        
        
        
        
        
        circleOrigin = circleView.frame.origin
        
        
    }
    
    func addPanGesture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pictureViewController.handlePan(sender:)))
        
        view.addGestureRecognizer(pan)
        
        
    }
    
    func addpanGestureView() {
        addPanGesture(view: circularView1)
        addPanGesture(view: circularView2)
        addPanGesture(view: circularView3)
        addPanGesture(view: circularView4)
        addPanGesture(view: circularView5)
        addPanGesture(view: circularView6)
        addPanGesture(view: circularView7)
        addPanGesture(view: circularView8)
        addPanGesture(view: circularView9)
        addPanGesture(view: circularView10)
        addPanGesture(view: circularView11)
    }
    
    func addSubViews() {
        view.addSubview(circularView1)
        view.addSubview(circularView2)
        view.addSubview(circularView3)
        view.addSubview(circularView4)
        view.addSubview(circularView5)
        view.addSubview(circularView6)
        view.addSubview(circularView7)
        view.addSubview(circularView8)
        view.addSubview(circularView9)
        view.addSubview(circularView10)
        view.addSubview(circularView11)
    }
    
    func subViewFrames() {
        circularView1.frame = CGRect(x: 200, y: 870, width: 40, height: 40)
        circularView2.frame = CGRect(x: 350, y: 900, width: 40, height: 40)
        circularView3.frame = CGRect(x: 450, y: 900, width: 40, height: 40)
        circularView4.frame = CGRect(x: 600, y: 870, width: 40, height: 40)
        circularView5.frame = CGRect(x: 200, y: 610, width: 40, height: 40)
        circularView6.frame = CGRect(x: 330, y: 650, width: 40, height: 40)
        circularView7.frame = CGRect(x: 470, y: 650, width: 40, height: 40)
        circularView8.frame = CGRect(x: 600, y: 610, width: 40, height: 40)
        circularView9.frame = CGRect(x: 260, y: 300, width: 40, height: 40)
        circularView10.frame = CGRect(x: 560, y: 300, width: 40, height: 40)
        circularView11.frame = CGRect(x: 400, y: 1030, width: 40, height: 40)
    }
    
    
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        let shapeView = sender.view!
        
        switch sender.state {
        case .began, .changed:
            
            moveViewWithPan(view: shapeView, sender: sender)
            
        case .ended:
            break
        default:
            returnViewToOrigin(view: shapeView)
        }
        
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewToOrigin(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            view.frame.origin = self.circleOrigin
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        
        homeButton.frame = CGRect(x: screenWidth * 0.82, y: screenHeight * 0.06, width: 60, height: 30)
        ledButton.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.06, width: 140, height: 40)
    }
}

