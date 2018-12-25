//
//  PhotoDetailsViewRouter.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation

protocol PhotoDetailsViewRouter: ViewRouter {
    func dismissView()
}

class PhotoDetailsViewRouterImplementation: PhotoDetailsViewRouter {
    fileprivate weak var photoDetailsViewController: PhotoDetailsViewController?
    
    init(photoDetailsViewController: PhotoDetailsViewController) {
        self.photoDetailsViewController = photoDetailsViewController
    }
    
    func dismissView() {
        let _ = photoDetailsViewController?.navigationController?.popViewController(animated: true)
    }
}
