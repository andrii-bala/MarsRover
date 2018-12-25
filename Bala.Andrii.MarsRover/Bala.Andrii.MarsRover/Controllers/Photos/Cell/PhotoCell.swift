//
//  PhotoCell.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell, PhotoCellView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoDateLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    
    func display(date: String) {
        photoDateLabel.text = date
    }
    
    func display(camera: String) {
        cameraNameLabel.text = camera
    }
    
    func display(imagePath: String) {
        if let url = URL(string: imagePath) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        }
    }
}
