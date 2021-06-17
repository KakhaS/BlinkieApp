//
//  databaseViewController.swift
//  
//
//  Created by Kakha Sepashvili on 25.04.21.
//

import UIKit

class databaseViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    static func nib() -> UINib {
        return UINib(nibName: "databaseViewController", bundle: nil)
    }
}
extension databaseViewController: UICollectionViewDatabase {
    
}
extension databaseViewController: UICollectionViewDelegate{
    
}
