//
//  PhotosViewRouter.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit

protocol PhotosViewRouter: ViewRouter {
    func presentDetailsView(for photo: Photo)
}

class PhotosViewRouterImplementation: PhotosViewRouter {
    
    fileprivate weak var photosViewController: PhotosViewController?
    fileprivate var photo: Photo!
    
    init(photosViewController: PhotosViewController) {
        self.photosViewController = photosViewController
    }
    
    func presentDetailsView(for photo: Photo) {
        self.photo = photo
        photosViewController?.performSegue(withIdentifier: "DetailsViewController", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoDetailsViewController = segue.destination as? PhotoDetailsViewController {
            photoDetailsViewController.configurator = PhotoDetailsConfiguratorImplementation(photo: photo)
        }
    }
    
}
