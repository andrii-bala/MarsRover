//
//  PhotoDetailsConfigurator.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation

protocol PhotoDetailsConfigurator {
    func configure(photoDetailsViewController: PhotoDetailsViewController)
}

class PhotoDetailsConfiguratorImplementation: PhotoDetailsConfigurator {
    
    let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func configure(photoDetailsViewController: PhotoDetailsViewController) {

        let router = PhotoDetailsViewRouterImplementation(photoDetailsViewController: photoDetailsViewController)
        
        let presenter = PhotoDetailsPresenterImplementation(view: photoDetailsViewController,
                                                           photo: photo,
                                                           router: router)
        
        photoDetailsViewController.presenter = presenter
    }
}
