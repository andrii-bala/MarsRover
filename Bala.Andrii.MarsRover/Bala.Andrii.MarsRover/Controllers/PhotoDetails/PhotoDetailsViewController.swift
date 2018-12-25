//
//  PhotoDetailsViewController.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailsViewController: UIViewController {
    
    var presenter: PhotoDetailsPresenter!
    var configurator: PhotoDetailsConfigurator!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoDateLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(photoDetailsViewController: self)
        presenter.viewDidLoad()
    }
}

extension PhotoDetailsViewController: PhotoDetailsView {
    
    func display(imagePath: String) {
        if let url = URL(string: imagePath) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        }
    }
    
    func display(date: String) {
        photoDateLabel.text = date
    }
    
    func display(camera: String) {
        cameraNameLabel.text = camera
    }
}
