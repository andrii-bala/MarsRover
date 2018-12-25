//
//  ApiPhotosGateway.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiPhotosGateway: PhotosGateway {
    
}

class ApiPhotosGatewayImplementation: ApiPhotosGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchPhotos(completionHandler: @escaping (Result<[Photo]>) -> Void) {
        
        apiClient.execute { result in
            switch result {
            case let .success(response):
                completionHandler(.success(response.photos))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
