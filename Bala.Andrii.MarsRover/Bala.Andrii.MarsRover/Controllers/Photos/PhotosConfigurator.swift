//
//  PhotosConfigurator.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation

protocol PhotosConfigurator {
    func configure(photosViewController: PhotosViewController)
}

class PhotosConfiguratorImplementation: PhotosConfigurator {
    
    func configure(photosViewController: PhotosViewController) {
        
        let apiClient = ApiClientImplementation()
        let apiPhotosGateway = ApiPhotosGatewayImplementation(apiClient: apiClient)
        
        let displayPhotosUseCase = DisplayPhotosListUseCaseImplementation(photosGateway: apiPhotosGateway)
    
        let router = PhotosViewRouterImplementation(photosViewController: photosViewController)
        
        let presenter = PhotosPresenterImplementation(view: photosViewController,
                                                     displayPhotosUseCase: displayPhotosUseCase,
                                                     router: router)
        
        photosViewController.presenter = presenter
    }
}
