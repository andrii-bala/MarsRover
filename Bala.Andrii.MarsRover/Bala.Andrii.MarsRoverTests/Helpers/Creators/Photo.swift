//
//  Photo.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
@testable import Bala_Andrii_MarsRover

extension Photo {
    static func createPhotosArray() -> [Photo] {
        
        let url = Bundle(for: PhotosPresenterTest.self).url(forResource: "Photos_test", withExtension: "txt")!
        do {
            let data = try Data(contentsOf: url)
            let photos = try [Photo].decode(data: data)
            return photos
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }
}
