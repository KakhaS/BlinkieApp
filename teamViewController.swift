//
//  teamViewController.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 27.04.21.
//

import UIKit

struct team {
  var  name: String
    var destination: String
    var viewController: UIViewController
}

class teamViewController: UIViewController {
    
    

    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var teamM: [team] = [
        team(name: "Ilonka", destination: "practiveViewController", viewController: practiveViewController()),
        team(name: "Tekla", destination: "test", viewController: practiveViewController()),
        team(name: "Kakha", destination: "test", viewController: practiveViewController()),
        team(name: "Aloy", destination: "test", viewController: practiveViewController()),
        team(name: "Jack", destination: "test", viewController: practiveViewController()),
        team(name: "Dean", destination: "test", viewController: practiveViewController()),
        team(name: "Sean", destination: "test", viewController: practiveViewController()),
        team(name: "Sam", destination: "test", viewController: practiveViewController()),
        team(name: "Bobby", destination: "test", viewController: practiveViewController()),
        team(name: "George", destination: "test", viewController: practiveViewController()),
        team(name: "Nick", destination: "test", viewController: practiveViewController()),
        team(name: "Elithabeth", destination: "test", viewController: practiveViewController()),
        team(name: "Neo", destination: "test", viewController: practiveViewController())
    ]
    
    
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @objc func didtapFirstRow() {
        let vc1 = storyboard?.instantiateViewController(identifier: "practiveViewController") as! practiveViewController
        
        vc1.modalPresentationStyle = .fullScreen
        present(vc1, animated: false)
    }
    
    private var topText: UILabel = {
        let topText = UILabel()
        topText.textColor = .white
        topText.backgroundColor = .systemBlue
        topText.text = "Team Members"
        return topText
    }()
    
  
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topText)
        backgroundImage.image = UIImage(named: "BackgroundFirstPage-1")
        backgroundImage.contentMode = .scaleToFill
        tableView.backgroundColor = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(homeButton)
        
    
    }
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topText.frame = CGRect(x: 370, y: 35, width: 120, height: 20)
        homeButton.frame = CGRect(x: 700, y: 35, width: 80, height: 40)
        
    }
}
extension teamViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc2 = storyboard?.instantiateViewController(identifier: teamM[indexPath.row].destination)
        vc2?.modalPresentationStyle = .fullScreen
        present(vc2!, animated: false)
    }
}
extension teamViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        let texts  = teamM[indexPath.row].name
        cell.textLabel?.text = texts
        
        return cell
    }
}

