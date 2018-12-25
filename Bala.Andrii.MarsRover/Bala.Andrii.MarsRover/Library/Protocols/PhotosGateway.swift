//
//  PhotosGateway.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire

typealias FetchPhotosEntityGatewayCompletionHandler = (_ photos: Result<[Photo]>) -> Void

protocol PhotosGateway {
    func fetchPhotos(completionHandler: @escaping FetchPhotosEntityGatewayCompletionHandler)
}
