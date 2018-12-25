//
//  DisplayPhotosList.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire

typealias DisplayPhotosUseCaseCompletionHandler = (_ photos: Result<[Photo]>) -> Void

protocol DisplayPhotosUseCase {
    func displayPhotos(completionHandler: @escaping DisplayPhotosUseCaseCompletionHandler)
}

class DisplayPhotosListUseCaseImplementation: DisplayPhotosUseCase {
    let photosGateway: ApiPhotosGatewayImplementation

    init(photosGateway: ApiPhotosGatewayImplementation) {
        self.photosGateway = photosGateway
    }

    // MARK: - DisplayPhotosUseCase

    func displayPhotos(completionHandler: @escaping DisplayPhotosUseCaseCompletionHandler) {
        self.photosGateway.fetchPhotos { (result) in
            completionHandler(result)
        }
    }
}
