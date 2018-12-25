//
//  ApiClient.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkServiceError: Error {
    case unknown
    case failed
}

protocol ApiClient {
    func execute(completionHandler: @escaping (Result<Photos>) -> Void)
}

class ApiClientImplementation: ApiClient {
    
    func execute(completionHandler: @escaping (Result<Photos>) -> Void) {
        let parameter: MoyaAPI = .getPhotos()
        moyaProvider.request(parameter) { result in
            if let data = result.value?.data {
                do {
                    let products = try Photos.decode(data: data)
                    completionHandler(.success(products))
                } catch let error {
                    completionHandler(.failure(error))
                }
                return
            }
            if let error = result.error {
                completionHandler(.failure(error))
                return
            }
        }
    }
}
