//
//  PhotosViewSpy.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
@testable import Bala_Andrii_MarsRover

class PhotosViewSpy: PhotosView {
    
    var refreshPhotosViewCalled = false
    var displayPhotosRetrievalErrorTitle: String?
    var displayPhotosRetrievalErrorMessage: String?
    
    func refreshPhotosView() {
        refreshPhotosViewCalled = true
    }
    
    func displayPhotosRetrievalError(title: String, message: String) {
        displayPhotosRetrievalErrorTitle = title
        displayPhotosRetrievalErrorMessage = message
    }
}

