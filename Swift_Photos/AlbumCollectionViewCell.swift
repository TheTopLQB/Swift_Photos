//
//  AlbumCollectionViewCell.swift
//  Swift_Photos
//
//  Created by 李庆彬 on 3/6/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!

    var image:UIImage = UIImage() {
        didSet {
            self.photoImageView.image = image;
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
