//
//  practiveViewController.swift
//  
//
//  Created by Kakha Sepashvili on 01.05.21.
//

import UIKit

struct Behaviors {
    var name: String
    var destination: String
}

class practiveViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
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
    
    private let ledSettings: UIButton = {
       let ledSettings = UIButton()
        ledSettings.setTitle("LED Settings", for: .normal)
        ledSettings.layer.borderWidth = 0.5
        ledSettings.layer.borderColor = UIColor.blue.cgColor
        ledSettings.backgroundColor = .white
        return ledSettings
    }()
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    private var topText: UILabel = {
        let topText = UILabel()
        topText.textColor = .white
        topText.backgroundColor = .systemBlue
        topText.text = "Practice"
        return topText
    }()
    
    var behavior: [Behaviors] = [
        
        Behaviors(name: "RunSpeed", destination: "test"),
        Behaviors(name: "Strike", destination: "test"),
        Behaviors(name: "Goalkeeping", destination: "test"),
        Behaviors(name: "TeamPlay", destination: "test"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .none
        
        view.addSubview(homeButton)
        view.addSubview(ledSettings)
        view.addSubview(topText)

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topText.frame = CGRect(x: 370, y: 35, width: 80, height: 40)
        homeButton.frame = CGRect(x: 700, y: 35, width: 80, height: 40)
        ledSettings.frame = CGRect(x: 80, y: 1800, width: 80, height: 40)
    }
}



extension practiveViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc4 = storyboard?.instantiateViewController(identifier: "behaviorViewController") as! behaviorViewController
        
        vc4.modalPresentationStyle = .fullScreen
        present(vc4, animated: false)
    }
}
extension practiveViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return behavior.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        cell.textLabel?.text = behavior[indexPath.row].name
        return cell
    }
}
