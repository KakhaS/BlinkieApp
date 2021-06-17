//
//  phoyoPageViewController.swift
//  
//
//  Created by Kakha Sepashvili on 30.04.21.
//

import UIKit

class photoPageViewController: UIViewController {
    
    private let backgroundPhoto: UIImageView = {
       let backgroundPhoto = UIImageView!
    
        
        return backgroundPhoto
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addsubview(backgroundPhoto)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
