//
//  infoCollectionViewCell.swift
//  Blinkie
//
//  Created by Kakha Sepashvili on 07.04.21.
//

import UIKit

class infoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleToFill
    }

    static func nib() -> UINib {
        return UINib(nibName: "infoCollectionViewCell", bundle: nil)
    }
}
