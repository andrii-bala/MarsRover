//
//  PhotoCellViewSpy.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
@testable import Bala_Andrii_MarsRover

class PhotoCellViewSpy: PhotoCellView {
    
    var displayedDate = ""
    var displayedCamera = ""
    var displayedImagePath = ""
    
    func display(date: String) {
        displayedDate = date
    }
    
    func display(camera: String) {
        displayedCamera = camera
    }
    
    func display(imagePath: String) {
        displayedImagePath = imagePath
    }
}
