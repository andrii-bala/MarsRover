//
//  PhotoDetailsPresenter.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit

protocol PhotoDetailsView: class {
    func display(imagePath: String)
    func display(date: String)
    func display(camera: String)
}

protocol PhotoDetailsPresenter {
    var router: PhotoDetailsViewRouter { get }
    func viewDidLoad()
}

class PhotoDetailsPresenterImplementation: PhotoDetailsPresenter {
    fileprivate let photo: Photo
    let router: PhotoDetailsViewRouter
    fileprivate weak var view: PhotoDetailsView?
    
    init(view: PhotoDetailsView,
         photo: Photo,
         router: PhotoDetailsViewRouter) {
        self.view = view
        self.photo = photo
        self.router = router
    }
    
    func viewDidLoad() {
        view?.display(imagePath: photo.img_src)
        view?.display(date: photo.earth_date)
        view?.display(camera: photo.camera.full_name)
    }
}
