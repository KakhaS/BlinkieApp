//
//  behaviorViewController.swift
//  
//
//  Created by Kakha Sepashvili on 15.05.21.
//

import UIKit

struct behavior {
  var  name: String
    var destination: String
    var viewController: UIViewController
}

class behaviorViewController: UIViewController {
    
    var behaviorM: [behavior] = [
        behavior(name: "Ball Possesion", destination: "detailsViewController", viewController: detailsViewController()),
        behavior(name: "Pass accuracy", destination: "test", viewController: practiveViewController()),
        behavior(name: "Goalkeeping Skills", destination: "test", viewController: practiveViewController())]
    
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
    
    private var topText: UILabel = {
        let topText = UILabel()
        topText.textColor = .white
        topText.backgroundColor = .systemBlue
        topText.text = "Behavior Management"
        return topText
    }()
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundPhoto: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage-1")
        backgroundPhoto.contentMode = .scaleToFill
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .none
        
        view.addSubview(homeButton)
        view.addSubview(topText)
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topText.frame = CGRect(x: 370, y: 35, width: 120, height: 20)
        homeButton.frame = CGRect(x: 700, y: 35, width: 80, height: 40)
    }

}
extension behaviorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc2 = storyboard?.instantiateViewController(identifier: behaviorM[indexPath.row].destination)
        vc2?.modalPresentationStyle = .fullScreen
        present(vc2!, animated: false)
    }
}
extension behaviorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return behaviorM.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let texts  = behaviorM[indexPath.row].name
        cell.textLabel?.text = texts

        return cell
    }
}
