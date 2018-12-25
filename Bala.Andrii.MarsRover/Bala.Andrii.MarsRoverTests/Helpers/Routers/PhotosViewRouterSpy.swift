//
//  PhotosViewRouterSpy.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
@testable import Bala_Andrii_MarsRover

class PhotosViewRouterSpy: PhotosViewRouter {
    var passedPhoto: Photo?
    
    func presentDetailsView(for photo: Photo) {
        passedPhoto = photo
    }
}

