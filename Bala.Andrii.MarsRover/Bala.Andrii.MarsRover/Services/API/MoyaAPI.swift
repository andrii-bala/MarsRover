//
//  MoyaAPI.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Moya
import Alamofire

let moyaProvider = MoyaProvider<MoyaAPI>()

public enum MoyaAPI {
    case getPhotos()
}

extension MoyaAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.nasa.gov")!
    }
    
    public var path: String {
        switch self {
        case .getPhotos: return "/mars-photos/api/v1/rovers/curiosity/photos"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getPhotos: return .get
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .getPhotos:
            return ["sol": "1000", "api_key" : "DEMO_KEY"]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    public var sampleData: Data {
        return " ".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String : String]? {
        return [:]
    }
}
