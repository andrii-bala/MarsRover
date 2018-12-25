//
//  DisplayPhotosUseCaseStub.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire
@testable import Bala_Andrii_MarsRover

class DisplayPhotosUseCaseStub: DisplayPhotosUseCase {
    var resultToBeReturned: Result<[Photo]>!
    
    func displayPhotos(completionHandler: @escaping DisplayPhotosUseCaseCompletionHandler) {
        completionHandler(resultToBeReturned)
    }
}
